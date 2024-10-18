library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.types.all;  -- Assuming types like byte_t, word_t are defined here

entity line_buffer_n3 is
  Port(
    clk   : in std_logic;
    reset : in std_logic;
    en    : in std_logic;       -- Enable signal
    shift    : in std_logic;       -- shift line_buffers
    d     : in word_t;          -- 32-bit input word
    full  : out std_logic;      -- Full signal indicating buffer is full
    n     : out halfword_t;         -- 16-bit output byte (byte_t should be std_logic_vector(7 downto 0))
    L1     : out line_array_t;    -- q is an array of bytes
    L2     : out line_array_t;    -- q is an array of bytes
    L3     : out line_array_t    -- q is an array of bytes
  );
end line_buffer_n3;

architecture rtl of line_buffer_n3 is
  
  -- State type declaration
  type state_type is (S0, S1, S2, S3, S4, S5, S6);
  
  -- Declare line_buffer component
  component line_buffer is
    Port (
      clk   : in std_logic;
      reset : in std_logic;
      en    : in std_logic;
      d     : in word_t;
      full  : out std_logic;
      n     : out halfword_t;
      q     : out line_array_t
    );
  end component;
  
  -- Signal declaration
  signal state, next_state : state_type;
  signal next_L1, next_L2, next_L3 : line_array_t;
  signal next_n : halfword_t;
  signal next_full : std_logic;
  signal en_lb1, en_lb2, en_lb3 :  std_logic;
  signal reset_lb1, reset_lb2, reset_lb3 :  std_logic;
  signal next_reset_lb1, next_reset_lb2, next_reset_lb3 :  std_logic;
  signal full_lb1, full_lb2, full_lb3 :  std_logic;
  signal n_lb1, n_lb2, n_lb3 :  halfword_t;
  signal q_lb1, q_lb2, q_lb3 :  line_array_t;

begin

  -- Instantiate 3 line_buffer components
  lb1: line_buffer
    Port map (
      clk   => clk,
      reset => reset_lb1,
      en    => en_lb1,
      d     => d,
      full  => full_lb1,
      n     => n_lb1,
      q     => q_lb1 
    );

  lb2: line_buffer
    Port map (
      clk   => clk,
      reset => reset_lb2,
      en    => en_lb2,
      d     => d,
      full  => full_lb2,
      n     => n_lb2,
      q     => q_lb2 
    );
  
  lb3: line_buffer
    Port map (
      clk   => clk,
      reset => reset_lb3,
      en    => en_lb3,
      d     => d,
      full  => full_lb3,
      n     => n_lb3,
      q     => q_lb3
    );

  -- Combinational logic for state transitions and index calculation
  comb_logic : process(state, en, full_lb1, full_lb2, full_lb3, q_lb1, q_lb2, q_lb3, n_lb1, n_lb2, n_lb3, shift)
  begin
    -- Set default values 
    next_state <= state;
    en_lb1 <= '0';
    en_lb2 <= '0';
    en_lb3 <= '0';
    next_reset_lb1 <= '0';
    next_reset_lb2 <= '0';
    next_reset_lb3 <= '0';
   
    next_full <= full_lb3;
    next_L1 <= q_lb1;
    next_L2 <= q_lb2;
    next_L3 <= q_lb3;
    next_n <= n_lb3; 

    case state is
      when S0 =>

        if en = '1' then
          if full_lb1 = '0' and full_lb2 = '0' and full_lb3 = '0' then
            en_lb1 <= '1';
          elsif full_lb1 = '1' and full_lb2 = '0' and full_lb3 = '0' then 
            en_lb2 <= '1';
          elsif full_lb1 = '1' and full_lb2 = '1' and full_lb3 = '0' then 
            en_lb3 <= '1';
          elsif full_lb1 = '1' and full_lb2 = '1' and full_lb3 = '1' then 
            next_state <= S1; 
          end if; 
        end if;

      when S1 =>
        if shift = '1' then
          next_L1 <= q_lb2;
          next_L2 <= q_lb3;
          next_L3 <= q_lb1;
          next_reset_lb1 <= '1'; -- Only set this here
          next_n <= n_lb1;
          next_full <= full_lb1; 
          next_state <= S2;
        end if;


      when S2 =>
        next_L1 <= q_lb2;
        next_L2 <= q_lb3;
        next_L3 <= q_lb1;
        next_n <= n_lb1;
        next_full <= full_lb1; 

        if full_lb1 = '1' then
          next_state <= S3; 
        elsif en = '1' then
          en_lb1 <= '1';
        end if;
      
      when S3 =>
        next_L1 <= q_lb2;
        next_L2 <= q_lb3;
        next_L3 <= q_lb1;
        next_n <= n_lb1;
        next_full <= full_lb1; 
        
        if shift = '1' then
          next_L1 <= q_lb3;
          next_L2 <= q_lb1;
          next_L3 <= q_lb2;
          next_reset_lb2 <= '1';  -- Only set this here
          next_n <= n_lb2;
          next_full <= full_lb2; 
          next_state <= S4;
        end if;
      
      when S4 =>
        next_L1 <= q_lb3;
        next_L2 <= q_lb1;
        next_L3 <= q_lb2;
        next_n <= n_lb2;
        next_full <= full_lb2; 

        if full_lb2 = '1' then
          next_state <= S5; 
        elsif en = '1' then
          en_lb2 <= '1';
        end if;
      
      when S5 =>
        next_L1 <= q_lb3;
        next_L2 <= q_lb1;
        next_L3 <= q_lb2;
        next_n <= n_lb2;
        next_full <= full_lb2; 

        if shift = '1' then
          next_reset_lb3 <= '1'; -- Only set this here
          next_state <= S6;
        end if;
      
      when S6 =>
        if full_lb3 = '1' then
          next_state <= S1; 
        elsif en = '1' then
          en_lb3 <= '1';
        end if;

      when others =>
    end case;
  end process comb_logic;

  sequential_logic : process(clk, reset)
  begin
    if reset = '1' then
      state <= S0;
      full <= '0'; -- Reset full flag
      reset_lb1 <= '1';
      reset_lb2 <= '1';
      reset_lb3 <= '1';
    elsif rising_edge(clk) then
      state <= next_state;     -- Update state synchronously
      full <= next_full;
      L1 <= next_L1;
      L2 <= next_L2;
      L3 <= next_L3;
      n <= next_n;
      reset_lb1 <= next_reset_lb1;
      reset_lb2 <= next_reset_lb2;
      reset_lb3 <= next_reset_lb3;
    end if;
  end process sequential_logic;
  
end architecture rtl;
