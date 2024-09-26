library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gcd_opt is
  port (
    clk   : in  std_logic;             -- Clock signal
    reset : in  std_logic;             -- Reset signal
    req   : in  std_logic;             -- Start signal
    AB    : in  unsigned(15 downto 0); -- Operand input
    ack   : out std_logic;             -- Completion signal
    C     : out unsigned(15 downto 0)  -- GCD result
  );
end gcd_opt;

architecture fsmd of gcd_opt is
  -- Define the FSM states
  type state_type is (S0, S1, S2, S3, S4, S5);
  signal state, next_state : state_type;

  -- Registers for operands and result
  signal reg_a, next_reg_a, reg_b, next_reg_b : unsigned(15 downto 0);
  signal temp_a_minus_b, temp_b_minus_a : unsigned(15 downto 0);

  -- Registers for ack and C outputs
  signal ack_reg, next_ack : std_logic;
  signal C_reg, next_C     : unsigned(15 downto 0);

begin

  -- Combinational logic (Next State and Datapath Logic)
  comb_logic : process(state, req, AB, reg_a, reg_b)
  begin
    -- Default assignments
    next_state <= state;
    next_reg_a <= reg_a;
    next_reg_b <= reg_b;
    next_ack <= ack_reg;    -- Keep ack stable by default
    next_C <= C_reg;        -- Keep C stable by default

    case state is
      -- S0: Wait for req = 1 to start
      when S0 =>
        if req = '1' then
          next_state <= S1;
        end if;

      -- S1: Load operand A
      when S1 =>
        next_reg_a <= AB;  -- Load A into reg_a
        next_ack <= '1';   -- Acknowledge that operand A is loaded
        next_state <= S2;

      -- S2: Wait for req to go low
      when S2 =>
        if req = '0' then
          next_ack <= '0';  -- Deassert ack
          next_state <= S3;
        end if;

      -- S3: Load operand B
      when S3 =>
        if req = '1' then
          next_reg_b <= AB;  -- Load B into reg_b
          next_state <= S4;
        end if;

      -- S4: Perform subtraction and check for equality
      when S4 =>
        -- Perform subtraction
        temp_a_minus_b <= reg_a - reg_b;
        temp_b_minus_a <= reg_b - reg_a;

        -- Check if GCD is found (reg_a = reg_b)
        if temp_a_minus_b = 0 then
          next_C <= reg_a;  -- Store result in C
          next_state <= S5;  -- Move to output state
        else
          -- Update reg_a or reg_b based on the result of subtraction
          if temp_a_minus_b(15) = '0' then
            next_reg_a <= temp_a_minus_b;  -- reg_a := reg_a - reg_b (positive result)
          else
            next_reg_b <= temp_b_minus_a;  -- reg_b := reg_b - reg_a (negative result)
          end if;
          next_state <= S4;  -- Stay in state S4 until GCD is found
        end if;

      -- S5: Output the result
      when S5 =>
        next_ack <= '1';   -- Acknowledge that the computation is done
        if req = '0' then  -- Wait for req to go low
          next_ack <= '0'; -- Deassert ack
          next_state <= S0;  -- Return to idle state
        end if;

      when others =>
        next_state <= S0;  -- Default to idle
    end case;
  end process;

  -- Sequential logic (State and Register Updates)
  seq_logic : process (clk, reset)
  begin
    if reset = '1' then
      -- Reset all registers and state
      state <= S0;
      reg_a <= (others => '0');
      reg_b <= (others => '0');
      ack_reg <= '0';      -- Reset ack signal
      C_reg <= (others => '0');  -- Reset result output
    elsif rising_edge(clk) then
      -- Update state and registers on each clock edge
      state <= next_state;
      reg_a <= next_reg_a;
      reg_b <= next_reg_b;
      C_reg <= next_C;     -- Update C on clock edge
      ack_reg <= next_ack; -- Update ack signal on clock edge
    end if;
  end process;

  -- Output assignments
  ack <= ack_reg;  -- Output the stable ack signal
  C <= C_reg;      -- Output the stable GCD result

end fsmd;
