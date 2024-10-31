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

entity gcd_module is
  generic (
        n: natural := 16 -- bit width
    );           
  port (
    clk     : in std_logic;               -- The clock signal.
    reset   : in  std_logic;              -- Reset the module.
    req     : in  std_logic;              -- Input operand / start computation.
    AB      : in  unsigned(15 downto 0);  -- The two operands.
    ack     : out std_logic;              -- Computation is complete.
    C       : out unsigned(15 downto 0)   -- The result.
  ); 
end gcd_module;

architecture structure of gcd_module is

    -- signals
    signal FN_int                                           : std_logic_vector(1 downto 0);
    signal clk_int, rst_int, aboralu_int, lda_int, 
           ldb_int, n_int, z_int                            : std_logic;       

    -- component declaration
    component fsm
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

            FN          : out   std_logic_vector(1 downto 0)   -- ALU operation control signal.
        );
    end component fsm;

    component datapath
        port (
            clk         : in    std_logic;          -- The clock signal.
            reset       : in    std_logic;          -- Reset the module.

            AB          : in  unsigned(15 downto 0);  -- The two operands.
            C           : out unsigned(15 downto 0);  -- The result.

            ABorALU     : in    std_logic;          -- Control signal for input mux.
            LDA         : in    std_logic;          -- Enable signal for Register A.
            LDB         : in    std_logic;          -- Enable signal for Register B.

            N           : out   std_logic;          -- Result (Y) is negative signal from alu.
            Z           : out   std_logic;          -- Result (Y) is zero signal from alu.

            FN          : in    std_logic_vector(1 downto 0)   -- ALU operation control signal.
        );
    end component datapath;

begin

    -- component instantiation
    fsm_component : fsm 
        port map (
            clk     => clk_int,
            reset   => rst_int,

            req     => req,
            ack     => ack,

            ABorALU => aboralu_int,
            LDA     => lda_int,
            LDB     => ldb_int,

            N       => n_int,
            Z       => z_int,

            FN      => fn_int
        );

    datapath_component: datapath 
        port map (
            clk     => clk_int,
            reset   => rst_int,

            AB      => AB,
            C       => C,
            
            ABorALU => aboralu_int,
            LDA     => lda_int,
            LDB     => ldb_int,

            N       => n_int,
            Z       => z_int,

            FN      => fn_int
        );

    -- nets
    clk_int     <= clk;
    rst_int     <= reset;
    
    -- combinatorial logic
    
    -- registers

end structure;

