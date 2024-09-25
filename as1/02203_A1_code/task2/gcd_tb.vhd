library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gcd is
  port (
    clk   : in  std_logic;             -- The clock signal
    reset : in  std_logic;             -- Reset the module
    req   : in  std_logic;             -- Input operand / start computation
    AB    : in  unsigned(15 downto 0); -- The two operands
    ack   : out std_logic;             -- Computation is complete
    C     : out unsigned(15 downto 0)  -- The result
  );
end gcd;

architecture fsmd of gcd is

  -- Define the FSM states with labels 0 to 7
  type state_type is (S0, S1, S2, S3, S4, S5, S6, S7);
  signal state, next_state : state_type;

  -- Registers for operands and result
  signal reg_a, next_reg_a, reg_b, next_reg_b : unsigned(15 downto 0);
  signal ack_reg, next_ack : std_logic;

begin

  -------------------------------------------------------------------
  -- Combinational Logic (Next State and Datapath Logic)
  -------------------------------------------------------------------
  comb_logic : process(state, req, AB, reg_a, reg_b)
  begin
    -- Default assignments
    next_state <= state;
    next_reg_a <= reg_a;
    next_reg_b <= reg_b;
    next_ack <= ack_reg;  -- Keep the ack signal stable by default
    C <= (others => '0');  -- Default C output is zero

    case state is
      -- S0 (Idle) state: wait for req = 1 to start
      when S0 =>
        if req = '1' then
          next_state <= S1;
        end if;

      -- S1 (Load A) state: load operand A into regA and set ack to 1
      when S1 =>
        next_reg_a <= AB;  -- Load A into reg_a
        next_ack <= '1';   -- Acknowledge that operand A is loaded
        next_state <= S2;

      -- S2 (Idle Between Handshakes): wait for req to go low
      when S2 =>
        if req = '0' then
          next_ack <= '0';  -- Drop ack
          next_state <= S3;  -- Ready to load operand B
        end if;

      -- S3 (Load B) state: load operand B into regB
      when S3 =>
        if req = '1' then
          next_reg_b <= AB;  -- Load B into reg_b
          next_state <= S4;
        end if;

      -- S4 (Compare) state: compare regA and regB
      when S4 =>
        if reg_a = reg_b then
          next_state <= S5;  -- GCD found, move to output
        elsif reg_a > reg_b then
          next_state <= S6;  -- Subtract regB from regA
        else
          next_state <= S7;  -- Subtract regA from regB
        end if;

      -- S5 (Output Result) state: output the GCD and set ack
      when S5 =>
        C <= reg_a;         -- Output the result (GCD is in regA)
        next_ack <= '1';    -- Acknowledge that the computation is done
        if req = '0' then   -- Wait for req to be 0 before resetting
          next_ack <= '0';
          next_state <= S0;  -- Return to idle
        end if;

      -- S6 (Subtract B from A) state: regA := regA - regB
      when S6 =>
        next_reg_a <= reg_a - reg_b;
        next_state <= S4;  -- Return to comparison

      -- S7 (Subtract A from B) state: regB := regB - regA
      when S7 =>
        next_reg_b <= reg_b - reg_a;
        next_state <= S4;  -- Return to comparison

      when others =>
        next_state <= S0;  -- Default to idle
    end case;
  end process comb_logic;

  -------------------------------------------------------------------
  -- Sequential Logic (State and Register Updates)
  -------------------------------------------------------------------
  seq_logic : process (clk, reset)
  begin
    if reset = '1' then
      -- Reset all registers and state
      state <= S0;
      reg_a <= (others => '0');
      reg_b <= (others => '0');
      ack_reg <= '0';   -- Reset ack signal
    elsif rising_edge(clk) then
      -- Update the state and registers on each clock edge
      state <= next_state;
      reg_a <= next_reg_a;
      reg_b <= next_reg_b;
      ack_reg <= next_ack;   -- Update ack only on clock edge
    end if;
  end process seq_logic;

  -- Output assignment
  ack <= ack_reg;  -- Assign the clocked ack signal to output

end fsmd;
