library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DAY_1_OR is
Port (a : in std_logic;
      b : in std_logic;
      c : out std_logic
       );
end DAY_1_OR;

architecture Behavioral of DAY_1_OR is

begin
c <=  a or b;

end Behavioral;
