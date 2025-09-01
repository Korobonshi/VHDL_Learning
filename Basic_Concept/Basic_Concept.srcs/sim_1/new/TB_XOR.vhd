----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/01/2025 10:24:08 AM
-- Design Name: 
-- Module Name: TB_XOR - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_XOR is
--  Port ( );
end TB_XOR;

architecture Behavioral of TB_XOR is

signal a_tb : std_logic;
signal b_tb : std_logic;
signal c_tb : std_logic; 

begin
uut : entity work.DAY_1_XOR
port map(
    a => a_tb,
    b => b_tb,
    c => c_tb
);


stim_proc : process
begin
    --- test 1 ---
    a_tb <= '1';
    b_tb <= '0';
    wait for 10ns;
    
    -- test 2 ---
    a_tb <= '0';
    b_tb <= '0';
    wait for 10ns;
    
    --- test 3 ---
    a_tb <= '1';
    b_tb <= '1';
    wait for 10ns;
    
    wait;
    
end process;
    
end Behavioral;




