library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gcd_opt_3 is
  port (
    clk   : in  std_logic;             -- Clock signal
    reset : in  std_logic;             -- Reset signal
    req   : in  std_logic;             -- Start signal
    AB    : in  unsigned(15 downto 0); -- Operand input
    ack   : out std_logic;             -- Completion signal (asynchronous)
    C     : out unsigned(15 downto 0)  -- GCD result
  );
end gcd_opt_3;

architecture fsmd of gcd_opt_3 is
  -- Define the FSM states
  type state_type is (S0, S1, S2);
  signal state, next_state : state_type;

  -- Registers for operands and result
  signal reg_a, next_reg_a, reg_b, next_reg_b : unsigned(15 downto 0);

  -- Subtraction results done outside the process
  signal temp_a_minus_b, temp_b_minus_a : unsigned(15 downto 0);

begin

  -- Perform subtractions concurrently outside the process
  temp_a_minus_b <= reg_a - reg_b;
  temp_b_minus_a <= reg_b - reg_a;
  C <= reg_a;   -- Assign C to reg_a by default

  -- Combinational logic for state transitions and datapath
  comb_logic : process(state, req, AB, reg_a, reg_b, temp_a_minus_b, temp_b_minus_a)
  begin
    -- Default assignments
    next_state <= state;
    next_reg_a <= reg_a;
    next_reg_b <= reg_b;
    ack <= '0';  -- Default ack value

    case state is
      -- S0: Wait for req = '1' to load operand A
      when S0 =>
        if req = '1' then
          next_reg_a <= AB;  -- Load A into reg_a
          ack <= '1';        -- Acknowledge that operand A is loaded
          next_state <= S1;  -- Move to S1 to wait for req deassertion
        else
          ack <= '0';        -- Deassert ack if req is not '1'
        end if;

      -- S1: Wait for req = '0', then load operand B
      when S1 =>
        if req = '0' then
          next_reg_b <= AB;  -- Load B into reg_b
          next_state <= S2;  -- Wait for req to go low before moving to S2
          ack <= '0';
        end if;

      -- S2: Load operand B and perform GCD calculation
      when S2 =>
        -- GCD calculation
        if temp_a_minus_b = 0 then
          ack <= '1';       -- Acknowledge that computation is done (asynchronous)
          if req = '0' then -- Wait for req to go low
            ack <= '0';     -- Deassert ack
            next_state <= S0; -- Return to idle state (S0)
          end if;
        else
          -- Update reg_a or reg_b based on the subtraction result
          if temp_a_minus_b(15) = '0' then
            next_reg_a <= temp_a_minus_b;  -- reg_a := reg_a - reg_b
          else
            next_reg_b <= temp_b_minus_a;  -- reg_b := reg_b - reg_a
          end if;
          next_state <= S2;  -- Stay in S2 until GCD is found
        end if;

      when others =>
        next_state <= S0;  -- Default to idle state (S0)
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
    end if;
    if rising_edge(clk) then
      -- Update state and registers on clock edge
      state <= next_state;
      reg_a <= next_reg_a;
      reg_b <= next_reg_b;
    end if;
  end process;

end fsmd;
