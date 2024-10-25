library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ram_dp is
  generic (
    DATA_WIDTH : integer;
    ADDR_WIDTH : integer
  );        
    Port (
      clk      : in  std_logic;
      we_a     : in  std_logic;
      addr_a   : in  std_logic_vector(ADDR_WIDTH - 1 downto 0);
      din_a    : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
      dout_a   : out std_logic_vector(DATA_WIDTH - 1 downto 0);
      we_b     : in  std_logic;
      addr_b   : in  std_logic_vector(ADDR_WIDTH - 1 downto 0);
      din_b    : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
      dout_b   : out std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
end ram_dp;

architecture rtl of ram_dp is

  -- Shared memory for both ports
  type mem_type is array (0 to (2**ADDR_WIDTH)-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
  Shared variable mem : mem_type := (others => (others => '0'));  -- Shared variable for memory

begin

  -- Process for Port A (read/write)
  process(all)
  begin
    if rising_edge(clk) then
      if we_a = '1' then
        mem(to_integer(unsigned(addr_a))) := din_a;  -- Write to memory at Port A
      end if;
      dout_a <= mem(to_integer(unsigned(addr_a)));    -- Read from memory at Port A
    end if;
  end process;

  -- Process for Port B (read/write)
  process(all)
  begin
    if rising_edge(clk) then
      if we_b = '1' then
        mem(to_integer(unsigned(addr_b))) := din_b;  -- Write to memory at Port B
      end if;
      dout_b <= mem(to_integer(unsigned(addr_b)));   -- Read from memory at Port B
    end if;
  end process;

end rtl;
