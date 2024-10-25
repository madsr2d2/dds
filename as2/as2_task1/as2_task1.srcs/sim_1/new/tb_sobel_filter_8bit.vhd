library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types_pkg.all;  -- Make sure this is where your types_pkg is stored.

entity sobel_filter_tb is
end sobel_filter_tb;

architecture tb of sobel_filter_tb is

  -- Signal declarations
  signal sobel_in  : sobel_lines := (others => (others => '0'));
  signal sobel_out : std_logic_vector(7 downto 0);

  -- Clock and reset signals
  signal clk : std_logic := '0';
  signal reset : std_logic := '0';

  -- Constants for clock period
  constant clk_period : time := 10 ns;

  -- Instantiate the Unit Under Test (UUT)
  component sobel_filter_8bit
    Port (
      sobel_in  : in sobel_lines;
      sobel_out : out std_logic_vector(7 downto 0)
    );
  end component;

begin

  -- Clock generation process
  clk_process : process
  begin
    clk <= '0';
    wait for clk_period / 2;
    clk <= '1';
    wait for clk_period / 2;
  end process clk_process;

  -- Instantiate the Sobel filter
  UUT: sobel_filter_8bit
    Port map (
      sobel_in  => sobel_in,
      sobel_out => sobel_out
    );

  -- Stimulus process
  stimulus_process : process
  begin

    -- Initialize inputs
    wait for 20 ns;

    -- Apply some test data using natural numbers and convert to std_logic_vector
    -- Line 0: pixel values 12, 34, 56
    sobel_in.line_0 <= std_logic_vector(to_unsigned(12, 8)) & std_logic_vector(to_unsigned(34, 8)) & std_logic_vector(to_unsigned(56, 8));
    
    -- Line 1: pixel values 78, 90 (only 2 values for this line, as per your setup)
    sobel_in.line_1 <= std_logic_vector(to_unsigned(78, 8)) & std_logic_vector(to_unsigned(90, 8));
    
    -- Line 2: pixel values 11, 22, 33
    sobel_in.line_2 <= std_logic_vector(to_unsigned(11, 8)) & std_logic_vector(to_unsigned(22, 8)) & std_logic_vector(to_unsigned(33, 8));

    wait for clk_period;
    
    -- Apply different test data
    -- Line 0: pixel values 100, 150, 200
    sobel_in.line_0 <= std_logic_vector(to_unsigned(100, 8)) & std_logic_vector(to_unsigned(150, 8)) & std_logic_vector(to_unsigned(200, 8));

    -- Line 1: pixel values 50, 75
    sobel_in.line_1 <= std_logic_vector(to_unsigned(50, 8)) & std_logic_vector(to_unsigned(75, 8));
    
    -- Line 2: pixel values 25, 35, 45
    sobel_in.line_2 <= std_logic_vector(to_unsigned(25, 8)) & std_logic_vector(to_unsigned(35, 8)) & std_logic_vector(to_unsigned(45, 8));

    wait for clk_period;

    -- Add more test cases as needed
    -- ...

    -- Finish simulation
    wait for 100 ns;
    assert false report "End of simulation" severity note;
    wait;
  end process stimulus_process;

end tb;
