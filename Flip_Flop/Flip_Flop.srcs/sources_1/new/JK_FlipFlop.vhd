----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/02/2025 09:21:40 PM
-- Design Name: 
-- Module Name: JK_FlipFlop - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity JK_FlipFlop is
Port ( J, K, clk : in std_logic;
        Q, Q_Bar : out std_logic
     );
end JK_FlipFlop;

architecture Behavioral of JK_FlipFlop is

begin
process (clk)
variable temp : std_logic;
begin
    if rising_edge (clk) then
        if (J = '0' and K = '0') then
            temp := temp;
        elsif (J = '1' and K = '1') then
            temp := not temp;
        elsif (J = '0' and K = '1') then
            temp := '0';
        else 
            temp := '1';
        end if;
   end if;
   
   Q <= temp;
   Q_Bar <= not temp;

end process;
end Behavioral;
