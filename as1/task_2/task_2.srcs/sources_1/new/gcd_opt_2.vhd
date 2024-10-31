library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gcd_opt_2 is
  port (
    clk   : in  std_logic;             -- Clock signal
    reset : in  std_logic;             -- Reset signal
    req   : in  std_logic;             -- Start signal
    AB    : in  unsigned(15 downto 0); -- Operand input
    ack   : out std_logic;             -- Completion signal (asynchronous)
    C     : out unsigned(15 downto 0)  -- GCD result
  );
end gcd_opt_2;

architecture fsmd of gcd_opt_2 is
  type state_type is (S0, S1, S2, S3);
  signal state, next_state : state_type;
  signal reg_a, next_reg_a, reg_b, next_reg_b : unsigned(15 downto 0);
  signal temp_a_minus_b, temp_b_minus_a : unsigned(15 downto 0);

begin

  temp_a_minus_b <= reg_a - reg_b;
  temp_b_minus_a <= reg_b - reg_a;
  C <= reg_a;

  -- Combinational logic for state transitions and datapath
  comb_logic : process(state, req, AB, reg_a, reg_b, temp_a_minus_b, temp_b_minus_a)
  begin
    next_state <= state;
    next_reg_a <= reg_a;
    next_reg_b <= reg_b;
    ack <= '0';
    
    case state is
      when S0 =>
        if req = '1' then
          next_reg_a <= AB;
          ack <= '1';
          next_state <= S1;
        end if;

      when S1 =>
        ack <= '1';
        if req = '0' then
          next_state <= S2;
        end if;

      when S2 =>
        if req = '1' then
          next_reg_b <= AB;
          next_state <= S3;
        end if;

      when S3 =>
        if reg_a = reg_b then
          ack <= '1';
          if req = '0' then
            ack <= '0';
            next_state <= S0;
          end if;
          
        elsif reg_a > reg_b then
          next_reg_a <= temp_a_minus_b;
        
        else
          next_reg_b <= temp_b_minus_a;
        end if;

      when others =>
        next_state <= S0;
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
      state <= next_state;
      reg_a <= next_reg_a;
      reg_b <= next_reg_b;
    end if;
  end process;

end fsmd;
