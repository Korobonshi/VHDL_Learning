----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/02/2025 09:44:43 PM
-- Design Name: 
-- Module Name: T_FlipFlop - Behavioral
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

entity T_FlipFlop is
Port ( T, clk : in std_logic;
       Q, Q_Bar : out std_logic
     );
end T_FlipFlop;

architecture Behavioral of T_FlipFlop is

signal temp : std_logic;

begin
process(clk)
begin
    if rising_edge (clk) then
        if (T = '0') then
            temp <= temp;
         elsif (T = '1') then
            temp <= not temp;
         end if;
    end if;
    
    Q <= temp;
    Q_Bar <= not temp;
    
end process;
end Behavioral;
