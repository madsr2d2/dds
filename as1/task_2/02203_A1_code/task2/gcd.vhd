library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gcd is
  port (
    clk   : in  std_logic;
    reset : in  std_logic;
    req   : in  std_logic;
    AB    : in  unsigned(15 downto 0);
    ack   : out std_logic;
    C     : out unsigned(15 downto 0)
  );
end gcd;

architecture fsmd of gcd is
  type state_type is (S0, S1, S2, S3, S4, S5, S6, S7);
  signal state, next_state : state_type;
  signal reg_a, next_reg_a, reg_b, next_reg_b, C_reg, next_C : unsigned(15 downto 0);
  signal ack_reg, next_ack : std_logic;

begin

  -------------------------------------------------------------------
  -- Combinational Logic (Next State and Datapath Logic)
  -------------------------------------------------------------------
  comb_logic : process(state, req, AB, reg_a, reg_b,ack_reg,C_reg)
  begin
    next_state <= state;
    next_reg_a <= reg_a;
    next_reg_b <= reg_b;
    next_ack <= ack_reg;
    next_C <= C_reg;
    case state is
      when S0 =>
        if req = '1' then
          next_state <= S1;
        end if;

      when S1 =>
        next_reg_a <= AB;
        next_ack <= '1';
        next_state <= S2;

      when S2 =>
        if req = '0' then
          next_ack <= '0';
          next_state <= S3;
        end if;

      when S3 =>
        if req = '1' then
          next_reg_b <= AB;
          next_state <= S4;
        end if;

      when S4 =>
        if reg_a = reg_b then
          next_state <= S5;
        elsif reg_a > reg_b then
          next_state <= S6;
        else
          next_state <= S7;
        end if;

      when S5 =>
        next_C <= reg_a;
        next_ack <= '1';
        if req = '0' then
          next_ack <= '0';
          next_state <= S0;
        end if;

      when S6 =>
        next_reg_a <= reg_a - reg_b;
        next_state <= S4;

      when S7 =>
        next_reg_b <= reg_b - reg_a;
        next_state <= S4;

      when others =>
        next_state <= S0;
    end case;
  end process comb_logic;

  -------------------------------------------------------------------
  -- Sequential Logic (State and Register Updates)
  -------------------------------------------------------------------
  seq_logic : process (clk, reset)
  begin
    if reset = '1' then
      state <= S0;
      reg_a <= (others => '0');
      reg_b <= (others => '0');
      C_reg <= (others => '0');
      ack_reg <= '0';
    elsif rising_edge(clk) then
      state <= next_state;
      reg_a <= next_reg_a;
      reg_b <= next_reg_b;
      ack_reg <= next_ack;
      C_reg <= next_C;
    end if;
  end process seq_logic;

  ack <= ack_reg;
  C <= C_reg;
end fsmd;
