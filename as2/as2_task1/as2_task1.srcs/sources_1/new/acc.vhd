library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types_pkg.all;

entity acc is
  Port (
    clk        : in std_logic;
    reset      : in std_logic;
    addr       : out std_logic_vector(15 downto 0); -- Address for RAM
    dataR      : in std_logic_vector(31 downto 0);
    dataW      : out std_logic_vector(31 downto 0);
    base_addr  : in std_logic_vector(15 downto 0);  -- Base address for RAM
    en     : out std_logic;
    we     : out std_logic;
    start    : in std_logic;
    finish    : out std_logic
  );
end acc;

architecture rtl of acc is

  -- State types
  type state_type is (IDLE, LOAD_PREVIOUS_LINE, LOAD_CURRENT_LINE, LOAD_NEXT, WRITE_SOBEL_TO_RAM, DONE);
  signal state, next_state : state_type;

  -- Image and pixel parameters
  constant image_height : NATURAL := 288;
  constant image_width  : NATURAL := 352;
  constant pixel_width  : NATURAL := 8;
  constant word_width   : NATURAL := 32;
  constant ADDR_PER_LINE : NATURAL := image_width/(word_width/pixel_width) -  1;
  constant WRITE_OFFSET : NATURAL := ADDR_PER_LINE*image_height;

  signal line_index     : NATURAL := 0;


  -- Buffer index used to rotate buffers when full
  signal buffer_index : NATURAL := 0;

  type sobel_in_array_type is array(0 to 3) of sobel_lines;  
  type sobel_out_array_type is array(0 to 3) of STD_LOGIC_VECTOR(7 downto 0);
  signal sobel_in : sobel_in_array_type;
  signal sobel_out : sobel_out_array_type;

  type padding_type is array(0 to 2) of STD_LOGIC_VECTOR(15 downto 0);
  signal padding : padding_type := (others => (others => '0')); 

  -- Internal RAM address and control for main image RAM
  signal internal_addr  : natural := 0;

  -- Buffer signals and constants
  constant BUFFER_DATA_WIDTH : NATURAL := word_width; 
  constant BUFFER_ADDR_WIDTH : NATURAL := 7; 
  signal buffer_addr : NATURAL := 0; 

  type buffer_we_array_type is array(0 to 2) of STD_LOGIC;
  type buffer_data_array_type is array(0 to 2) of STD_LOGIC_VECTOR(BUFFER_DATA_WIDTH - 1 downto 0);

  signal buffer_we_a : buffer_we_array_type := (others => '0');
  signal buffer_dout_b : buffer_data_array_type := (others => (others => '0'));

  signal buffer_we_internala : buffer_we_array_type := (others => '0');
  signal buffer_dout_b_internal : buffer_data_array_type := (others => (others => '0'));

  -- Sobel filter component
  component sobel_filter_8bit is
    Port (
      sobel_in  : in sobel_lines;
      sobel_out : out std_logic_vector(7 downto 0)
    );
  end component;

  -- Dual port RAM component as line buffers 
  component ram_dp is
    generic (
      ADDR_WIDTH : integer := 7;
      DATA_WIDTH : integer := 32
    );
    Port (
      clk      : in  std_logic;
      we_a     : in  std_logic;
      addr_a   : in  std_logic_vector(ADDR_WIDTH - 1 downto 0);
      din_a    : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
      dout_a   : out std_logic_vector(DATA_WIDTH - 1 downto 0);
      we_b     : in  std_logic;
      addr_b   : in  std_logic_vector(ADDR_WIDTH - 1 downto 0);
      din_b    : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
      dout_b   : out std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
  end component;

begin
  -- Instantiate sobel filters
  sobel_filter_gen: for i in 0 to 3 generate 
    sobel_filter_inst: sobel_filter_8bit
      port map (
        sobel_in => sobel_in(i),
        sobel_out => sobel_out(i)
      );
  end generate sobel_filter_gen;

  -- Instantiate line buffers
  line_buffer_gen: for i in 0 to 2 generate
    line_buffer_inst: ram_dp 
      port map (
        clk      => clk,
        we_a     => buffer_we_a(i),
        addr_a   => std_logic_vector(to_unsigned(buffer_addr, BUFFER_ADDR_WIDTH)),
        din_a    => dataR,
        dout_a   => open,
        we_b     => '0',  -- Port B for reading (Sobel processing)
        addr_b   => std_logic_vector(to_unsigned(buffer_addr, BUFFER_ADDR_WIDTH)),
        din_b    => (others => '0'),
        dout_b   => buffer_dout_b(i)
      );
  end generate line_buffer_gen;
  
-- Sequential process for FSM and data operations (FSMD approach)
process(all)
begin
  -- Set default values
  if rising_edge(clk) then
    if reset = '1' then
      state <= IDLE;
      line_index <= 0;
      internal_addr <= to_integer(unsigned(base_addr));
      buffer_addr <= 0;
      buffer_index <= 0;

    else
      state <= next_state; -- Update state

      if state = LOAD_PREVIOUS_LINE or state = LOAD_CURRENT_LINE or state = LOAD_NEXT then
        internal_addr <= internal_addr + 1; -- Increment external RAM address
        buffer_addr <= buffer_addr + 1; -- Increment buffer RAM address
        addr <= std_logic_vector(to_unsigned(internal_addr, 16)); -- Set read address
      elsif state = IDLE then
        line_index <= 0;
      end if;

      if state = WRITE_SOBEL_TO_RAM then
          addr <= std_logic_vector(to_unsigned(internal_addr + WRITE_OFFSET, 16)); -- Set write address
          dataW <= sobel_out(3) & sobel_out(2) & sobel_out(1) & sobel_out(0); 

          -- update padding
          padding(0) <= buffer_dout_b_internal(0)(31 downto 16);
          padding(1) <= buffer_dout_b_internal(1)(31 downto 16);
          padding(2) <= buffer_dout_b_internal(2)(31 downto 16);

        if buffer_addr = 0 then
          -- Sobel filter for pixel n - 1
          sobel_in(0).line_0 <= buffer_dout_b_internal(0)(7 downto 0) & buffer_dout_b_internal(0)(7 downto 0) & buffer_dout_b_internal(0)(7 downto 0); 
          sobel_in(0).line_1 <= buffer_dout_b_internal(1)(7 downto 0) & buffer_dout_b_internal(1)(7 downto 0);
          sobel_in(0).line_2 <= buffer_dout_b_internal(2)(7 downto 0) & buffer_dout_b_internal(2)(7 downto 0) & buffer_dout_b_internal(2)(7 downto 0);
          
          -- Sobel on pixel n
          sobel_in(1).line_0 <= buffer_dout_b_internal(0)(15 downto 8) & buffer_dout_b_internal(0)(7 downto 0) & buffer_dout_b_internal(0)(15 downto 8);
          sobel_in(1).line_1 <= buffer_dout_b_internal(1)(15 downto 8) & buffer_dout_b_internal(1)(15 downto 8);
          sobel_in(1).line_2 <= buffer_dout_b_internal(2)(15 downto 8) & buffer_dout_b_internal(2)(7 downto 0) & buffer_dout_b_internal(2)(15 downto 8);
          
          -- Sobel on pixel n + 1
          sobel_in(2).line_0 <= buffer_dout_b_internal(0)(23 downto 0);
          sobel_in(2).line_1 <= buffer_dout_b_internal(1)(23 downto 16) & buffer_dout_b_internal(1)(7 downto 0);
          sobel_in(2).line_2 <= buffer_dout_b_internal(2)(23 downto 0);
          
          -- Sobel on pixel n + 2
          sobel_in(3).line_0 <= buffer_dout_b_internal(0)(31 downto 8);
          sobel_in(3).line_1 <= buffer_dout_b_internal(1)(31 downto 24) & buffer_dout_b_internal(1)(15 downto 8);
          sobel_in(3).line_2 <= buffer_dout_b_internal(2)(31 downto 8);

        else
          -- Sobel filter for pixel n - 1
          sobel_in(0).line_0 <= buffer_dout_b_internal(0)(7 downto 0) & padding(0); 
          sobel_in(0).line_1 <= buffer_dout_b_internal(1)(7 downto 0) & padding(1)(7 downto 0);
          sobel_in(0).line_2 <= buffer_dout_b_internal(2)(7 downto 0) & padding(2);
          
          -- Sobel on pixel n
          sobel_in(1).line_0 <= buffer_dout_b_internal(0)(15 downto 0) & padding(0)(15 downto 8);
          sobel_in(1).line_1 <= buffer_dout_b_internal(1)(15 downto 8) & padding(1)(15 downto 8);
          sobel_in(1).line_2 <= buffer_dout_b_internal(2)(15 downto 0) & padding(2)(15 downto 8);
          
          -- Sobel on pixel n + 1
          sobel_in(2).line_0 <= buffer_dout_b_internal(0)(23 downto 0);
          sobel_in(2).line_1 <= buffer_dout_b_internal(1)(23 downto 16) & buffer_dout_b_internal(1)(7 downto 0);
          sobel_in(2).line_2 <= buffer_dout_b_internal(2)(23 downto 0);
          
          -- Sobel on pixel n + 2
          sobel_in(3).line_0 <= buffer_dout_b_internal(0)(31 downto 8);
          sobel_in(3).line_1 <= buffer_dout_b_internal(1)(31 downto 24) & buffer_dout_b_internal(1)(15 downto 8);
          sobel_in(3).line_2 <= buffer_dout_b_internal(2)(31 downto 8);
          end if;
      end if;

      -- Wrap around pixel index after a full line
      if buffer_addr = ADDR_PER_LINE then
        buffer_addr <= 0;
        line_index <= line_index + 1; -- Increment line index

        -- Raotate buffers 
        if line_index > 1 then
          if buffer_index = 2 then
            buffer_index <= 0;
          else
            buffer_index <= buffer_index + 1;

          end if;
        end if;
      end if;
    end if;
  end if;
end process;

-- Combinational process for FSM state transitions and control signals
process(all)
begin
  -- Default values
  next_state <= state;
  en <= '0';
  we <= '0';
  finish <= '0';
  buffer_we_a <= (others => '0');
  buffer_we_internala <= (others => '0');

  -- Rotate buffers
  case buffer_index is 
    when 0 =>
      buffer_we_a(0) <= buffer_we_internala(0);
      buffer_we_a(1) <= buffer_we_internala(1);
      buffer_we_a(2) <= buffer_we_internala(2);
      buffer_dout_b_internal(0) <= buffer_dout_b(0);
      buffer_dout_b_internal(1) <= buffer_dout_b(1);
      buffer_dout_b_internal(2) <= buffer_dout_b(2);

    when 1 =>
      buffer_we_a(0) <= buffer_we_internala(2);
      buffer_we_a(1) <= buffer_we_internala(0);
      buffer_we_a(2) <= buffer_we_internala(1);
      buffer_dout_b_internal(0) <= buffer_dout_b(2);
      buffer_dout_b_internal(1) <= buffer_dout_b(0);
      buffer_dout_b_internal(2) <= buffer_dout_b(1);

    when others =>
      buffer_we_a(0) <= buffer_we_internala(1);
      buffer_we_a(1) <= buffer_we_internala(2);
      buffer_we_a(2) <= buffer_we_internala(0);
      buffer_dout_b_internal(0) <= buffer_dout_b(1);
      buffer_dout_b_internal(1) <= buffer_dout_b(2);
      buffer_dout_b_internal(2) <= buffer_dout_b(0);
  end case;

  case state is
    when IDLE =>
      if start = '1' then
        next_state <= LOAD_PREVIOUS_LINE;
      end if;

    when LOAD_PREVIOUS_LINE =>
      en <= '1';
      buffer_we_internala(0) <= '1'; -- Enable write to buffer 0

      if buffer_addr = ADDR_PER_LINE then
        next_state <= LOAD_CURRENT_LINE;
      end if;

    when LOAD_CURRENT_LINE =>
      en <= '1';
      buffer_we_internala(1) <= '1'; -- Enable write to buffer 1

      if buffer_addr = ADDR_PER_LINE then
        next_state <= LOAD_NEXT;
      end if;

    when LOAD_NEXT =>
      en <= '1';
      buffer_we_internala(2) <= '1'; -- Enable write to buffer 2
      next_state <= WRITE_SOBEL_TO_RAM;
      
      if line_index = image_height - 2 then
        next_state <= DONE;  -- All pixels processed, move to DONE state
      end if;
    
    when WRITE_SOBEL_TO_RAM =>
      we <= '1';
      en <= '1';
      buffer_we_internala(2) <= '1'; -- Enable write to buffer 2
      next_state <= LOAD_NEXT;
      
    when DONE =>
      finish <= '1';  -- Set done signal
      next_state <= IDLE;

    when others =>
      next_state <= IDLE;
  end case;
end process;

-- RAM address and enable signal for main image RAM
end rtl;
