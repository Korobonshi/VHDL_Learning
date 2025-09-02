----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/02/2025 09:50:42 PM
-- Design Name: 
-- Module Name: TB_T_FlipFlop - Behavioral
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

entity TB_T_FlipFlop is
end TB_T_FlipFlop;

architecture Behavioral of TB_T_FlipFlop is
signal T_tb     : std_logic := '0';
signal Q_tb     : std_logic := '0';
signal Q_Bar_tb : std_logic := '0';
signal clk_tb   : std_logic := '0';

component TB_T_FlipFlop
Port ( T, clk : in std_logic;
       Q, Q_Bar : out std_logic
     );
end component;

begin

uut : TB_T_FlipFlop
    port map ( clk      => clk_tb,
               T        => T_tb,
               Q        => Q_tb,
               Q_Bar    => Q_Bar_tb
             );
             
clock_process : process
begin
    clk_tb <= '0';
    wait for 10ns;
    
    clk_tb <= '1';
    wait for 10ns;
end process;

stim_proc : process
begin
    
    T_tb <= '1';
    wait for 20ns;
    
    T_tb <= '0';
    wait for 20ns;

    T_tb <= '1';
    wait for 20ns;
    
    T_tb <= '1';
    wait for 20ns;
    
    T_tb <= '0';
    wait for 20ns;
    
    T_tb <= '1';
    wait for 20ns;
    
wait;
end process;
end Behavioral;
