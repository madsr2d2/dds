-- -----------------------------------------------------------------------------
--
--  Title      :  Testbench for the GCD module
--             :
--  Developers :  Jens Sparsø, Rasmus Bo Sørensen and Mathias Møller Bruhn
--             :
--  Purpose    :  A testbench for the gcd_top module providing a simulated clock
--             :  and a sequence of test data. This module is written using
--             :  imperative VHDL and is only used for testing (can not be
--             :  synthesised)
--             :
--  Revision   : 02203 fall 2022 v.7.0
--
-- -----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- The testbench entity is an completely isolated entity with no input/output
entity gcd_tb is
end gcd_tb;

-- Architecture of the testbench. Instantiates the gcd_top entity and provides it
-- with test data. The result is then compared to the actual result for verification.
architecture behaviour of gcd_tb is

	-- Period of the clock 
	constant CLOCK : time := 20 ns;

	component gcd_module
    generic (
      n : integer
    );
		port (clk : in std_logic;             -- The clock signal.
			reset : in  std_logic;              -- Reset the module.
			req   : in  std_logic;              -- Start computation.
			AB    : in  unsigned(15 downto 0);  -- The two operands.
			ack   : out std_logic;              -- Computation is complete.
			C     : out unsigned(15 downto 0)); -- The result.
	end component;

	-- Internal signals
	signal clk, reset : std_logic;
	signal req, ack   : std_logic;
	signal AB, C      : unsigned(15 downto 0);

begin

		-- Instantiate gcd_top module and wire it up to internal signals used for testing
		uut : gcd_module
      generic map (n => 2) 
      port map(
			clk   => clk,
			reset => reset,
			req   => req,
			AB    => AB,
			ack   => ack,
			C     => C
		);

	-- Clock generation (simulation use only)
	process
	begin
		clk <= '1'; wait for CLOCK/2;
		clk <= '0'; wait for CLOCK/2;
	end process;

	-- Process to provide test input to the entity in the testbench
	process

		constant N_OPS : natural := 100;
		-- constant N_OPS : natural := 6;

		type t_ops is array (0 to N_OPS-1) of natural;
		-- Change numbers here if you what to run different tests
		-- variable a_ops     : t_ops := (91, 32768, 49, 29232, 25, 62660);
		-- variable b_ops     : t_ops := (63, 272, 98, 488, 5, 4679);
		-- variable c_results : t_ops := (7, 16, 49, 8, 5, 1);
    

        variable a_ops     : t_ops := (57407, 51483, 26309, 17095, 55996, 2236, 53559, 47939, 43319, 43350, 38575, 49898, 36291, 14919, 302, 29913, 16728, 44656, 34619, 35771, 61336, 49269, 8033, 61840, 64102, 62239, 5778, 40060, 1686, 5675, 56136, 26657, 21805, 17543, 35029, 54941, 21660, 60696, 13626, 7762, 53903, 32076, 46766, 51636, 4719, 48288, 31634, 59056, 8881, 20200, 21876, 17116, 36699, 40423, 41394, 43073, 52862, 28926, 59475, 64315, 10037, 20063, 60880, 52962, 46993, 24061, 40658, 4093, 53036, 50578, 43898, 39453, 37550, 24044, 24493, 40326, 24995, 60468, 20284, 28575, 275, 50043, 16215, 49271, 13010, 1702, 49334, 26737, 61533, 57623, 21171, 10634, 12411, 58491, 34569, 745, 45073, 35634, 33855, 35682);
        variable b_ops     : t_ops := (17727, 62518, 6586, 32320, 36594, 1636, 58331, 31754, 49195, 55138, 36922, 45096, 7490, 58364, 40212, 45744, 18369, 3453, 23520, 10245, 8807, 3285, 21398, 27808, 6970, 46167, 26058, 44050, 7344, 48606, 2436, 10113, 51913, 42236, 49210, 41620, 25684, 6192, 37386, 1859, 56596, 57952, 49923, 40769, 33480, 18806, 17864, 10441, 11586, 46004, 63617, 19418, 4616, 6650, 22212, 47406, 55069, 13729, 45541, 58036, 25711, 35132, 45315, 61901, 17069, 38358, 26288, 62657, 40379, 50592, 5057, 45490, 35116, 52739, 55538, 13619, 14695, 42187, 4879, 14561, 32392, 45857, 23167, 33083, 9066, 10994, 47418, 42952, 2078, 13231, 60911, 10593, 10704, 32516, 5956, 14882, 6073, 24191, 18715, 8563);
        variable c_results : t_ops := (1, 1, 1, 5, 2, 4, 1, 1, 1, 2, 1, 2, 1, 1, 2, 3, 3, 1, 1, 1, 1, 3, 1, 16, 2, 1, 6, 10, 6, 1, 12, 1, 1, 1, 1, 1, 4, 72, 18, 1, 1, 4, 1, 1, 3, 2, 2, 1, 1, 4, 1, 2, 1, 1, 6, 1, 1, 1, 1, 1, 1, 1, 5, 7, 1, 1, 2, 1, 1, 2, 1, 1, 2, 1, 7, 1, 5, 1, 1, 1, 1, 7, 1, 1, 2, 46, 2, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 5, 1);

    begin

		-- Reset entity for some clock cycles
		reset <= '1';
		wait for CLOCK*4;
		reset <= '0';
		wait for CLOCK;

		for i in 0 to N_OPS-1 loop
			-- Supply first operand
			req <= '1';
			AB  <= to_unsigned(a_ops(i), AB'length);

			-- Wait for ack high
			while (ack /= '1') loop
				wait for CLOCK;
			end loop;

			req <= '0';

			-- Wait for ack low
			while (ack /= '0') loop
				wait for CLOCK;
			end loop;

			-- Supply second operand
			req <= '1';
			AB  <= to_unsigned(b_ops(i), AB'length);

			-- Wait for ack high
			while (ack /= '1') loop
				wait for CLOCK;
			end loop;
            
            
      -- Print the values of a, b, and the computed GCD (C)
      report "a = " & integer'image(a_ops(i)) &
         ", b = " & integer'image(b_ops(i)) &
         ", Computed GCD = " & integer'image(to_integer(C));

			-- Test the result of the computation
			assert C = to_unsigned(c_results(i),C'length) report "Wrong result!" severity failure;

			req <= '0';

			-- Wait for ack low
			while (ack /= '0') loop
				wait for CLOCK;
			end loop;

		end loop;

		wait for CLOCK;
		report "Tests succeeded!" severity note;
		std.env.stop(0);

	end process;

end behaviour;
