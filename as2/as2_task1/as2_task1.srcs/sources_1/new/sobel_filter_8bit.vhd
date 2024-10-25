library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types_pkg.all;

entity sobel_filter_8bit is
  Port (
    sobel_in  : in sobel_lines;
    sobel_out : out std_logic_vector(7 downto 0)
  );
end sobel_filter_8bit;

architecture rtl of sobel_filter_8bit is

  signal gx, gy         : integer := 0;
  signal sobel_result   : integer := 0;

begin
  process(all)
  begin
    gx <= to_integer(signed(sobel_in.line_0(7 downto 0)) - signed(sobel_in.line_0(23 downto 16))) +
          2 * to_integer(signed(sobel_in.line_1(7 downto 0)) - signed(sobel_in.line_1(15 downto 8))) +
          to_integer(signed(sobel_in.line_2(7 downto 0)) - signed(sobel_in.line_2(23 downto 16)));

    gy <= to_integer(signed(sobel_in.line_2(23 downto 16)) - signed(sobel_in.line_0(23 downto 16))) +
          2 * to_integer(signed(sobel_in.line_2(15 downto 8)) - signed(sobel_in.line_0(15 downto 8))) +
          to_integer(signed(sobel_in.line_2(7 downto 0)) - signed(sobel_in.line_0(7 downto 0)));

    sobel_result <= abs(gx) + abs(gy);
    
    -- Clip the Sobel result to fit 8 bits
    if sobel_result > 255 then
      sobel_out <= std_logic_vector(to_unsigned(255, 8));
    else
      sobel_out <= std_logic_vector(to_unsigned(sobel_result, 8));
    end if;
  end process;

end rtl;
