library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gcd_opt_4 is
  port (
    clk   : in  std_logic;             -- Clock signal
    reset : in  std_logic;             -- Reset signal
    req   : in  std_logic;             -- Start signal
    AB    : in  unsigned(15 downto 0); -- Operand input
    ack   : out std_logic;             -- Completion signal (asynchronous)
    C     : out unsigned(15 downto 0)  -- GCD result
  );
end gcd_opt_4;

architecture fsmd of gcd_opt_4 is
  -- Define the FSM states
  type state_type is (S0, S1, S2, S3);
  signal state, next_state : state_type;

  -- Registers for operands and result
  signal reg_a, next_reg_a, reg_b, next_reg_b : unsigned(15 downto 0);
  signal next_C: unsigned(15 downto 0); -- Result signal for GCD

begin

  -- Combinational logic for state transitions and datapath
  comb_logic : process(state, req, AB, reg_a, reg_b)
  begin
    -- Default assignments
    next_state <= state;
    next_reg_a <= reg_a;
    next_reg_b <= reg_b;
    next_C <= C;  -- Keep C stable by default
    ack <= '0';

    case state is
      -- S0: Wait for req = '1' to load operand A
      when S0 =>
        if req = '1' then
          next_reg_a <= AB;  -- Load A into reg_a
          ack <= '1';        -- Acknowledge that operand A is loaded
          next_state <= S1;  -- Move to S1 to load operand B
        end if;

      -- S1: Load operand B when req = '1'
      when S1 =>
        if req = '0' then
          ack <= '0';        -- Deassert ack
        elsif req = '1' then
          next_reg_b <= AB;  -- Load B into reg_b
          next_state <= S2;  -- Move to GCD calculation
        end if;

      -- S2: Perform GCD calculation using subtraction
      when S2 =>
        -- If reg_a == reg_b, the GCD has been found
        if reg_a = reg_b then
          next_C <= reg_a;   -- Output the GCD result
          ack <= '1';        -- Acknowledge that the computation is done
          next_state <= S3;  -- Move to final state
        
        -- If reg_a > reg_b, subtract reg_b from reg_a
        elsif reg_a > reg_b then
          next_reg_a <= reg_a - reg_b;  -- reg_a := reg_a - reg_b
        
        -- If reg_b > reg_a, subtract reg_a from reg_b
        else
          next_reg_b <= reg_b - reg_a;  -- reg_b := reg_b - reg_a
        end if;

      -- S3: Wait for req to go low and return to idle state
      when S3 =>
        if req = '0' then
          ack <= '0';       -- Deassert ack
          next_state <= S0; -- Return to idle state (S0)
        end if;

      when others =>
        next_state <= S0;  -- Default to idle state
    end case;
  end process;

  -- Sequential logic for state and register updates
  seq_logic : process (clk, reset)
  begin
    if reset = '1' then
      -- Reset all registers and state
      state <= S0;
      reg_a <= (others => '0');
      reg_b <= (others => '0');
      C <= (others => '0');
      ack <= '0';
    elsif rising_edge(clk) then
      -- Update state and registers on clock edge
      state <= next_state;
      reg_a <= next_reg_a;
      reg_b <= next_reg_b;
      C <= next_C;          -- Assign GCD result to output C
    end if;
  end process;

end fsmd;
