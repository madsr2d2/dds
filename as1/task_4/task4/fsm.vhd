-- -----------------------------------------------------------------------------
--
--  Title      :  Structural model of GCD for task 4
--             :
--  Developers :  Stephan
--             :
--  Purpose    :  Solving task 4 that focuses on how VHDL can be used
--             :  to construct schematics that expresses structural
--             :  implementation of circuits.
--  Note       :  
--             :  
--             :  
--             :
--  Revision   :  fall 2024 version 1
--
-- -----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is
  port (
    clk         : in    std_logic;          -- The clock signal.
    reset       : in    std_logic;          -- Reset the module.

    req         : in    std_logic;          -- Request signal indicating that input is ready for input MUX.-
    ack         : out   std_logic;          -- Acknowledge signal indicating that input A has been received or that output C is valid.
    
    ABorALU     : out   std_logic;          -- Control signal for input mux.
    LDA         : out   std_logic;          -- Enable signal for Register A.
    LDB         : out   std_logic;          -- Enable signal for Register B.

    N           : in    std_logic;          -- Result (Y) is negative signal from alu.
    Z           : in    std_logic;          -- Result (Y) is zero signal from alu.

    FN          : out   std_logic_vector(1 downto 0) -- ALU operation control signal.
  );
end fsm;

architecture structure of fsm is

    type state_type is ( 
        ready_a,
        load_a,
        ready_b,
        load_b,
        calc,
        calc_done,
        sub_ba,
        sub_ab
       ); 

    -- signals
    signal curr_state, next_state : state_type;
    signal reg_a            : unsigned(15 downto 0);

begin

    -- combinatorial logic
    cl : process (all)
    begin
      -- defaults
  
      case (curr_state) is
        when ready_a =>
            FN      <= "10";
            ack     <= '0';

            if (req = '1') then
                next_state <= load_a;
            end if;

        when load_a =>
            FN      <= "10";
            ABorALU <= '1';
            LDA     <= '1';
            ack     <= '1';

            if (req = '0') then
                next_state <= ready_b;
            end if;

        when ready_b =>
            ABorALU <= '0';
            LDA     <= '0';
            ack     <= '0';

            if (req = '1') then
                next_state <= load_b;
            end if;         

        when load_b =>
            FN      <= "11";
            ABorALU <= '1';
            LDB     <= '1';

            if (req = '1') then
                next_state <= calc;
            end if;

        when calc =>
            FN      <= "00";
            ABorALU <= '0';
            LDA     <= '0';
            LDB     <= '0';

            if (Z = '1') then
                next_state <= calc_done;
            elsif (N = '1') then
                next_state <= sub_ba;
            else 
                next_state <= sub_ab;
            end if;

        when calc_done =>
            FN      <= "10";
            ack     <= '1';

            if (req = '0') then
                next_state <= ready_a;
            end if;

        when sub_ba =>
            FN      <= "01";
            LDB     <= '1';
            
            next_state <= calc;

        when sub_ab =>
            LDA     <= '1';

            next_state <= calc;
        
        when others =>
          next_state <= ready_a;
  
      end case;
    end process cl;
    
    -- registers
    seq : process (clk, reset)
    begin
      if (rising_edge(clk)) then
        if (reset = '1') then
          curr_state <= ready_a;
        else
          curr_state <= next_state;
        end if;
      end if;
    end process seq;

end structure;

