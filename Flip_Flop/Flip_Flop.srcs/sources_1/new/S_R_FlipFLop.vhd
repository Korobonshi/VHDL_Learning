----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/02/2025 08:47:27 PM
-- Design Name: 
-- Module Name: S_R_FlipFLop - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity S_R_FlipFLop is
Port (  set, reset, clk : in std_logic;
        Q, Q_bar : out std_logic 
     );
end S_R_FlipFLop;

architecture Behavioral of S_R_FlipFLop is

begin
process(clk)
variable temp : std_logic;
    begin   
        if rising_edge (clk) then
            if (set = '0' and reset = '0') then
                temp := temp;
            elsif (set = '1' and reset = '1') then
                temp := 'Z';
            elsif (set = '0' and reset = '1') then
                temp := '0';
            else    
                temp := '1';
            end if;
       end if;
       
   Q <= temp;
   Q_BAR <= not temp;
   
   end process;
end Behavioral;
