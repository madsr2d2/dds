library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.types.all;  -- Assuming types like byte_t, word_t are defined here

entity line_buffer is
  Port(
    clk   : in std_logic;
    reset : in std_logic;
    en    : in std_logic;       -- Enable signal
    d     : in word_t;          -- 32-bit input word
    full  : out std_logic;      -- Full signal indicating buffer is full
    n     : out halfword_t;     -- 16-bit output byte
    q0    : out std_logic_vector(7 downto 0);  -- First byte of the array
    q1    : out std_logic_vector(7 downto 0);  -- Second byte of the array
    q2    : out std_logic_vector(7 downto 0)   -- Third byte of the array
  );
end line_buffer;

architecture Behavioral of line_buffer is

  -- State type declaration
  type state_type is (S0, S2);  -- Combined S0 and S1 into S0, kept S2 for when the buffer is full
  signal state, next_state : state_type;

  -- Line buffer for (352 bytes)
  signal line_array : line_array_t;
  
  signal index, next_index : natural := 0;
  signal full_internal : std_logic := '0'; -- Internal full flag

begin

  -- Combinational logic for state transitions and index calculation
  comb_logic : process(en, state, index, reset, next_index)
  begin
    -- Set default values
    next_state <= state;  -- Keep current state by default
    next_index <= index;  -- Keep current index by default

    case state is
      when S0 =>
        if en = '1' then
          -- Write to the next available positions in the line buffer
          next_index <= index + 4;  -- Move to the next index
          
          -- Check if the next index will exceed the buffer limit
          if next_index = line_width then
            next_state <= S2;  -- Transition to the full state
          end if;
        end if;

      when S2 =>
        if reset = '1' then
          next_state <= S0;    -- Return to initial state
          next_index <= 0;
        end if;

      when others =>
        next_state <= S0;  -- Default state
    end case;
  end process comb_logic;

  -- Sequential logic for writing/reading the line buffer (synchronous access)
  sequential_logic : process(clk, reset)
  begin
    if reset = '1' then
      state <= S0;
      index <= 0;
      full_internal <= '0'; -- Reset full flag

    elsif rising_edge(clk) then
      state <= next_state;     -- Update state synchronously
      index <= next_index;     -- Update index synchronously

      if en = '1' then
        -- Write the input word to line_array synchronously
        line_array(index)     <= d(7 downto 0);
        line_array(index + 1) <= d(15 downto 8);
        line_array(index + 2) <= d(23 downto 16);
        line_array(index + 3) <= d(31 downto 24);

        -- Update n based on the next_index
        n <= std_logic_vector(to_unsigned(next_index, 16));  -- Use next_index directly

        -- Output the next 3 elements of the line_array
        q0 <= line_array(next_index);
        q1 <= line_array(next_index + 1);
        q2 <= line_array(next_index + 2);
      end if;

      -- Set full flag if the buffer is full
      if next_index = line_width then
        full_internal <= '1';
      else
        full_internal <= '0';
      end if;
    end if;
  end process sequential_logic;

  -- Output assignment (3 elements of the array)
  full <= full_internal; -- Assign the internal full signal to the output

end Behavioral;
