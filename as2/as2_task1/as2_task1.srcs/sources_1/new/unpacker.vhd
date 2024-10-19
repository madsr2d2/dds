library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.types.all;  -- Assuming types like byte_t, word_t are defined here

entity unpacker is
  Port(
    clk : in std_logic;
    reset : in std_logic;
    next_en : in std_logic;
    data : in word_t;
    base_addr : in halfword_t;

    done : out std_logic;
    ram_en : out std_logic;
    addr : out halfword_t;
    x_out : out std_logic_vector(47 downto 0);
    y_out : out std_logic_vector(47 downto 0)
  );
end unpacker;

architecture rtl of unpacker is
  type state_type is (S0, S1, S2, S3, S4, S5, S6, S7); 
  signal state, next_state : state_type;
  signal n_pix : natural := 0; 
  signal x_out_internal : array_6; 
  signal y_out_internal : array_6;
  signal b1, b2, b3, b1_next, b2_next, b3_next : byte_t := byte_zero;
       

begin
  
  comb_logic: process(state, next_en)
  begin
    -- Set default values
    ram_en <= '0';
    b1 <= b1_next;
    b2 <= b2_next;
    b3 <= b3_next;

    case state is

      when S0 =>
        n_pix <= 0;
        addr <= base_addr;
        if next_en = '1' then
          next_state <= S1;
        end if;

      when S1 =>
        ram_en <= '1';
        if n_pix = C2 then
          
        end if;



    when others =>
      

   end case; 
  end process comb_logic;
  
  
  
end architecture rtl;
