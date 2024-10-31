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

entity datapath is
  port (
    clk         : in    std_logic;          -- The clock signal.
    reset       : in    std_logic;          -- Reset the module.

    AB          : in  unsigned(15 downto 0);  -- The two operands.
    C           : out unsigned(15 downto 0);   -- The result.

    ABorALU     : in    std_logic;          -- Control signal for input mux.
    LDA         : in    std_logic;          -- Enable signal for Register A.
    LDB         : in    std_logic;          -- Enable signal for Register B.

    N           : out   std_logic;          -- Result (Y) is negative signal from alu.
    Z           : out   std_logic;          -- Result (Y) is zero signal from alu.

    FN          : in    std_logic_vector(1 downto 0)   -- ALU operation control signal.
  );
end datapath;

architecture structure of datapath is
    -- configurable constant parameters,
    constant bit_width      : natural := 16;

    -- signals
    signal C_int, Y, RegA_int, RegB_int        : unsigned(15 downto 0) := (others => '0');

    -- component declaration
    component buf
        generic (
            N : natural
        );
        port (
            data_in:  in  unsigned(N downto 1);	-- input.
            data_out: out unsigned(N downto 1)
        );
    end component buf;

    component mux
        generic (
            N : natural
        );
        port (
            data_in1:  in  unsigned(N downto 1);	-- inputs.
            data_in2:  in unsigned(N downto 1);
            s       :  in std_logic;				-- select signal.
            data_out:  out  unsigned(N downto 1)	-- output.
        );
    end component mux;

    component reg
        generic (
            N : natural
        );
        port (
            clk:      in  std_logic;				-- clock signal.
            en:       in  std_logic;				-- enable signal.
            data_in:  in  unsigned(N downto 1);	    -- input data.
            data_out: out unsigned(N downto 1)      -- output data.
        );
    end component reg;

    component alu
        generic (
            W : natural
        );
        port (
            A, B:     in unsigned(w downto 1);			-- input operands.
            fn:       in std_logic_vector(1 downto 0); 	-- function.
            C:        out unsigned(W downto 1);			-- result.
            Z:        out std_logic;          			-- result = 0 flag.
            N:        out std_logic
        );
    end component alu;

begin

    -- component instantiation

    output_buffer : buf
        generic map (N => bit_width)
        port map (
            data_in  => C_int,
            data_out => C
        );
    
    input_mux : mux
        generic map (N => bit_width)
        port map (
            --data_in1    => AB,
            --data_in2    => Y,
            data_in1    => Y,
            data_in2    => AB,
            s           => ABorALU,
            data_out    => C_int
        );

    RegA : reg
        generic map (N => bit_width)
        port map (
            clk         => clk,
            en          => LDA,
            data_in     => C_int,
            data_out    => RegA_int
        );
    
    RegB : reg
        generic map (N => bit_width)
        port map (
            clk         => clk,
            en          => LDB,
            data_in     => C_int,
            data_out    => RegB_int
        );

    arithmic : alu
        generic map (W => bit_width)
        port map (
            A           => RegA_int,
            B           => RegB_int,
            fn          => FN,
            C           => Y,
            Z           => Z,
            N           => N
        );

    -- combinatorial logic
    
    -- registers

end structure;

