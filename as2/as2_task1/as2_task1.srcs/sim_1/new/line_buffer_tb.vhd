library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.types.all;  -- Assuming types like byte_t, word_t, and line_array_t are defined here

entity line_buffer_tb is
end line_buffer_tb;

architecture Behavioral of line_buffer_tb is

  -- Testbench signals
  signal clk   : std_logic := '0';
  signal reset : std_logic := '0';
  signal en    : std_logic := '0';
  signal d     : word_t := (others => '0');   -- 32-bit input word
  signal full  : std_logic;
  signal n     : halfword_t;                      -- 8-bit output byte (index)
  signal q     : line_array_t;                -- Output line buffer array

  -- Constants
  constant clk_period : time := 10 ns;  -- Clock period

  -- DUT instance
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

begin

  -- Instantiate the Device Under Test (DUT)
  DUT: line_buffer
    Port map (
      clk   => clk,
      reset => reset,
      en    => en,
      d     => d,
      full  => full,
      n     => n,
      q     => q
    );

  -- Clock generation
  clk_process : process
  begin
    while true loop
      clk <= '0';
      wait for clk_period / 2;
      clk <= '1';
      wait for clk_period / 2;
    end loop;
  end process clk_process;

  -- Stimulus process
  stimulus_process : process
    variable i : integer := 0;
  begin

    -- Initial reset
    reset <= '1';
    wait for 2 * clk_period;
    reset <= '0';
    wait for 2 * clk_period;

    -- Start the write operation by enabling 'en'
    en <= '1';

    -- Loop to fill the buffer until the full flag is raised
    while full = '0' loop
      -- Generate some test data and write to the buffer
      d <= std_logic_vector(to_unsigned(i * 4 + 1, 32));  -- Generate some simple incrementing data

      -- Wait for one clock cycle before checking the full flag again
      wait for clk_period;
      i := i + 1;  -- Increment the index variable for the next word
    end loop;

    -- Once full flag is raised, disable the enable signal
    en <= '0';

    -- Finish the simulation
    wait for 2 * clk_period;
    report "Simulation complete. Buffer is full." severity note;
    wait;
  end process stimulus_process;

end Behavioral;
