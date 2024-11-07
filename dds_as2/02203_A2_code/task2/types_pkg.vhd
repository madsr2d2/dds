
library IEEE;
use IEEE.std_logic_1164.all;

package types_pkg is

  type sobel_lines is record
    line_0  : std_logic_vector(23 downto 0);  -- 24 bits
    line_1 : std_logic_vector(15 downto 0);  -- 16 bits
    line_2  : std_logic_vector(23 downto 0);  -- 24 bits
  end record;

end package types_pkg;
