library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity line_buffer_memory is
    port(
        clk   : in  std_logic;
        en    : in  std_logic;    -- Enable signal
        we    : in  std_logic;    -- Write enable
        addr  : in  std_logic_vector(8 downto 0);  -- Adjusted to fit 352 bytes (log2(352) = 9 bits)
        dataW : in  std_logic_vector(7 downto 0);  -- 8-bit data (byte)
        dataR : out std_logic_vector(7 downto 0)   -- 8-bit data output (byte)
    );
end entity line_buffer_memory;

architecture rtl of line_buffer_memory is

    -- Declare RAM to store 352 bytes
    type ram_type is array (0 to 351) of std_logic_vector(7 downto 0);
    signal RAM : ram_type := (others => (others => '0'));  -- Initialize memory to zeros

    -- Attribute for block RAM inference
    attribute ram_style : string;
    attribute ram_style of RAM : signal is "block";  -- Force BRAM usage

begin

    -- RAM process for reading and writing
    process(clk)
    begin
        if rising_edge(clk) then
            if en = '1' then
                if we = '1' then
                    -- Write data to RAM
                    RAM(to_integer(unsigned(addr))) <= dataW;
                end if;
                -- Read data from RAM
                dataR <= RAM(to_integer(unsigned(addr)));
            end if;
        end if;
    end process;

end architecture rtl;
