library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DAY_1_AND is  
Port (
       a : in std_logic;
       b : in std_logic;
       c : out std_logic
 );
end DAY_1_AND;

architecture Behavioral of DAY_1_AND is
    
begin
    c <= a AND b;

end Behavioral;
