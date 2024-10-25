library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_ram_buffer_2 is
end tb_ram_buffer_2;

architecture behavior of tb_ram_buffer_2 is

  -- Component declaration of the entity to be tested
  component ram_buffer_2 is
    Port (
      clk        : in std_logic;
      reset      : in std_logic;
      next_en    : in std_logic;
      data       : in std_logic_vector(31 downto 0);
      done_en    : out std_logic;
      addr       : out std_logic_vector(15 downto 0);
      sobel_out  : out std_logic_vector(31 downto 0)
    );
  end component;

  -- Testbench signals
  signal clk        : std_logic := '0';
  signal tb_reset   : std_logic := '0';  -- Renamed reset signal
  signal next_en    : std_logic := '0';
  signal data       : std_logic_vector(31 downto 0) := (others => '0');
  signal done_en    : std_logic;
  signal addr       : std_logic_vector(15 downto 0);
  signal sobel_out  : std_logic_vector(31 downto 0);

  -- Clock period definition
  constant clk_period : time := 10 ns;

begin

  -- Instantiate the unit under test (UUT)
  uut: ram_buffer_2
    port map (
      clk        => clk,
      reset      => tb_reset,  -- Use renamed reset signal
      next_en    => next_en,
      data       => data,
      done_en    => done_en,
      addr       => addr,
      sobel_out  => sobel_out
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
    variable pixel_data : natural := 0;  -- Starting pixel value as a natural
  begin
    -- Reset the system
    tb_reset <= '1';
    wait for 20 ns;
    tb_reset <= '0';
    wait for 20 ns;

    -- Enable the next state (simulate that data is ready)
    next_en <= '1';
    wait for clk_period;
    next_en <= '0';

    -- Wait for system to be ready for data and provide it
    wait until rising_edge(clk);

    while done_en /= '1' loop
      -- Check if addr is non-zero and provide data
      if addr /= std_logic_vector(to_unsigned(0, addr'length)) then
        -- Simulate writing pixel data
        data <= std_logic_vector(to_unsigned(pixel_data, 32));
        pixel_data := pixel_data + 1;
      end if;
      wait until rising_edge(clk);
    end loop;

    -- Wait for Sobel processing and result output
    wait for 100 ns;

    -- End simulation
    wait;
  end process stimulus;

end behavior;
