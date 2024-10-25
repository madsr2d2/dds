----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2024 12:44:16 PM
-- Design Name: 
-- Module Name: sobel acc_1_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_sobel_acc_1 is
end tb_sobel_acc_1;

architecture behavior of tb_sobel_acc_1 is

  -- Component declaration of the entity to be tested
  component sobel_acc_1 is
    Port (
      clk        : in std_logic;
      reset      : in std_logic;
      next_en    : in std_logic;
      data       : in std_logic_vector(31 downto 0);
      base_addr  : in std_logic_vector(15 downto 0);
      done_en    : out std_logic;
      ram_en     : out std_logic;
      addr       : out std_logic_vector(15 downto 0);
      sobel_out  : out std_logic_vector(7 downto 0)
    );
  end component;

  -- Testbench signals
  signal clk        : std_logic := '0';
  signal reset      : std_logic := '0';
  signal next_en    : std_logic := '0';
  signal data       : std_logic_vector(31 downto 0) := (others => '0');
  signal base_addr  : std_logic_vector(15 downto 0) := (others => '0');
  signal done_en    : std_logic;
  signal ram_en     : std_logic;
  signal addr       : std_logic_vector(15 downto 0);
  signal sobel_out  : std_logic_vector(7 downto 0);

  -- Clock period definition
  constant clk_period : time := 10 ns;

begin
  -- Instantiate the unit under test (UUT)
  uut: sobel_acc_1
    port map (
      clk        => clk,
      reset      => reset,
      next_en    => next_en,
      data       => data,
      base_addr  => base_addr,
      done_en    => done_en,
      ram_en     => ram_en,
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
  begin
    -- Reset the system
    reset <= '1';
    wait for 20 ns;
    reset <= '0';
    wait for 20 ns;

    -- Provide base address
    base_addr <= std_logic_vector(to_unsigned(0, 16));

    -- Enable the next state (simulate that RAM has data ready)
    next_en <= '1';

    -- Provide sample data to the system (you can modify this with actual image data)
    data <= x"11223344";  -- First 4 pixels
    wait for clk_period;
    data <= x"55667788";  -- Next 4 pixels
    wait for clk_period;
    data <= x"99AABBCC";  -- Next 4 pixels
    wait for clk_period;
    data <= x"DDEEFF00";  -- Next 4 pixels
    wait for clk_period;

    -- Simulate more data (fill in data as needed)
    -- Continue providing data until Sobel filtering completes
    wait for 1000 ns;  -- Wait for enough time for the Sobel filter to process
    
    -- Finish the simulation
    wait;
  end process stimulus;

end behavior;
--declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sobel acc_1_tb is
--  Port ( );
end sobel acc_1_tb;

architecture Behavioral of sobel acc_1_tb is

begin


end Behavioral;
