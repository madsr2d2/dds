library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench for full_adder
entity full_adder_tb is
    -- No ports in testbench
end full_adder_tb;

architecture testbench of full_adder_tb is

    -- Declare signals to connect to the full adder inputs and outputs
    signal test_A : STD_LOGIC := '0';
    signal test_B : STD_LOGIC := '0';
    signal test_C : STD_LOGIC := '0';  -- Carry input
    signal test_S : STD_LOGIC;         -- Sum output
    signal test_T : STD_LOGIC;         -- Carry output

begin

    -- Stimulus process to drive input signals
    proc_test: process
    begin
        -- Apply various test cases
        test_A <= '0'; test_B <= '0'; test_C <= '0'; wait for 50 ns;
        test_A <= '0'; test_B <= '0'; test_C <= '1'; wait for 50 ns;
        test_A <= '0'; test_B <= '1'; test_C <= '0'; wait for 50 ns;
        test_A <= '0'; test_B <= '1'; test_C <= '1'; wait for 50 ns;
        test_A <= '1'; test_B <= '0'; test_C <= '0'; wait for 50 ns;
        test_A <= '1'; test_B <= '0'; test_C <= '1'; wait for 50 ns;
        test_A <= '1'; test_B <= '1'; test_C <= '0'; wait for 50 ns;
        test_A <= '1'; test_B <= '1'; test_C <= '1'; wait for 50 ns;
        test_A <= '0'; test_B <= '0'; test_C <= '0'; wait for 50 ns;

        -- Stop simulation after all test cases
        wait;
    end process;

    -- Direct instantiation of full_adder without component declaration
    FA_inst: entity work.full_adder
        port map (
            A => test_A,
            B => test_B,
            C => test_C,
            S => test_S,
            T => test_T
        );

end testbench;
