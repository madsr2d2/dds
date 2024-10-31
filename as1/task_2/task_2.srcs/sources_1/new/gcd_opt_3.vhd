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
  type state_type is (S0, S1, S2, S3);
  signal state, next_state : state_type;

  -- Registers for operands and result
  signal reg_a, next_reg_a, reg_b, next_reg_b : unsigned(15 downto 0);

begin
  -- Combinational logic for state transitions and datapath
  comb_logic : process(state, req, AB, reg_a, reg_b)
  begin
    -- Default assignments
    next_state <= state;
    next_reg_a <= reg_a;
    next_reg_b <= reg_b;
    ack <= '0';
    C <= reg_a;   -- Assign C to reg_a by default
    
    case state is
      -- S0: Wait for req = '1' to load operand A
      when S0 =>
        if req = '1' then
          next_reg_a <= AB;  -- Load A into reg_a
          ack <= '1';        -- Acknowledge that operand A is loaded
          next_state <= S1;  -- Move to S1 to wait for req deassertion
        end if;

      -- S1: Wait for req = '0' before proceeding
      when S1 =>
        ack <= '1';
        if req = '0' then
          next_state <= S2;  -- Move to S2 to load operand B
        end if;

      -- S2: Load operand B when req = '1'
      when S2 =>
        if req = '1' then
          next_reg_b <= AB;  -- Load B into reg_b
          next_state <= S3;  -- Move to S3 to perform GCD calculation
        end if;

      -- S3: Perform GCD calculation
      when S3 =>
        -- Check if GCD is found (reg_a = reg_b)
        if reg_a = reg_b then
          ack <= '1';        -- Acknowledge that computation is done
          if req = '0' then
            ack <= '0';      -- Deassert ack
            next_state <= S0; -- Return to idle state (S0)
          end if;
          
        -- If reg_a > reg_b, update reg_a
        elsif reg_a > reg_b then
          next_reg_a <= reg_a - reg_b;  -- Subtract reg_b from reg_a
        
        -- If reg_b > reg_a, update reg_b
        else
          next_reg_b <= reg_b - reg_a;  -- Subtract reg_a from reg_b
        end if;

      when others =>
        next_state <= S0;  -- Default to idle state (S0)
    end case;
  end process;

  -- Sequential logic for state and register updates
  seq_logic : process (clk, reset)
  begin
    if reset = '1' then
      reg_a <= (others => '0');
      reg_b <= (others => '0');
      state <= S0;
    elsif rising_edge(clk) then
      -- Update state and registers on clock edge
      state <= next_state;
      reg_a <= next_reg_a;
      reg_b <= next_reg_b;
    end if;
  end process;

end fsmd;
