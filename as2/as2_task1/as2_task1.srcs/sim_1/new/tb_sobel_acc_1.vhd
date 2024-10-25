library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_acc_1 is
end tb_acc_1;

architecture behavior of tb_acc_1 is

  -- Component declaration of the entity to be tested
  component ram_buffer_1 is
    Port (
      clk        : in std_logic;
      reset      : in std_logic;
      next_en    : in std_logic;
      dataR       : in std_logic_vector(31 downto 0);
      dataW       : out std_logic_vector(31 downto 0);
      base_addr  : in std_logic_vector(15 downto 0);
      done_en    : out std_logic;
      ram_en     : out std_logic;
      ram_we     : out std_logic;
      addr       : out std_logic_vector(15 downto 0)
    );
  end component;

  -- Testbench signals
  signal clk        : std_logic := '0';
  signal tb_reset   : std_logic := '0';  -- Renamed reset signal
  signal next_en    : std_logic := '0';
  signal dataR       : std_logic_vector(31 downto 0) := (others => '0');
  signal dataW       : std_logic_vector(31 downto 0) := (others => '0');
  signal base_addr  : std_logic_vector(15 downto 0) := (others => '0');
  signal done_en    : std_logic;
  signal ram_en     : std_logic;
  signal ram_we     : std_logic;
  signal addr       : std_logic_vector(15 downto 0);

  -- Clock period definition
  constant clk_period : time := 10 ns;

begin

  -- Instantiate the unit under test (UUT)
  uut: ram_buffer_1
    port map (
      clk        => clk,
      reset      => tb_reset,  -- Use renamed reset signal
      next_en    => next_en,
      dataR       => dataR,
      dataW       => dataW,
      base_addr  => base_addr,
      done_en    => done_en,
      ram_en     => ram_en,
      ram_we     => ram_we,
      addr       => addr
    );

  -- Clock process definitions
  clk_process : process
  begin
    clk <= '0';
    wait for clk_period / 2;
    clk <= '1';
    wait for clk_period / 2;
  end process clk_process;

  -- Stimulus process
  stimulus: process
    variable pixel_data0 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');  -- Starting pixel value as a natural
    variable pixel_data1 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');  -- Starting pixel value as a natural
    variable pixel_data : STD_LOGIC_VECTOR(31 downto 0);  -- Starting pixel value as a natural

  begin
    -- Reset the system
    tb_reset <= '1';
    wait for 20 ns;
    tb_reset <= '0';
    wait for 20 ns;

    -- Provide base address
    base_addr <= std_logic_vector(to_unsigned(0, 16));

    -- Enable the next state (simulate that RAM has data ready)
    next_en <= '1';
    wait for clk_period;
    next_en <= '0';

    -- Wait for RAM enable signal and provide data
    wait until rising_edge(clk);

    while done_en /= '1' loop
      if ram_en = '1' then
        dataR <= pixel_data;

        pixel_data0 := STD_LOGIC_VECTOR(unsigned(pixel_data0) + 1);

        for i in pixel_data0'range loop
          pixel_data1(i) := pixel_data0(pixel_data0'length - 1 - i);
        end loop;

        pixel_data := pixel_data1 & pixel_data0;
      end if;
      wait until rising_edge(clk);
    end loop;

    -- Wait for the Sobel filter to process
    wait for 100 ns;

    -- Finish the simulation
    wait;
  end process stimulus;

end behavior;
