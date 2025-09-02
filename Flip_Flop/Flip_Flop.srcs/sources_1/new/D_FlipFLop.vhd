----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/02/2025 09:14:30 PM
-- Design Name: 
-- Module Name: D_FlipFLop - Behavioral
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

entity D_FlipFLop is
Port (  clk, reset, D_in : in std_logic;
        Q, Q_not : out std_logic 
      );
end D_FlipFLop;

architecture Behavioral of D_FlipFLop is

begin
process (clk)
begin
    if (reset = '1') then
        Q <= '0';
        Q_not <= '1';
    elsif rising_edge (clk) then
        Q <= D_in;
        Q_not <= not D_in;
    end if;
end process;

end Behavioral;
