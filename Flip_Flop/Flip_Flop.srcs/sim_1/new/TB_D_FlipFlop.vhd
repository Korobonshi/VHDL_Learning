----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/02/2025 09:50:42 PM
-- Design Name: 
-- Module Name: TB_D_FlipFlop - Behavioral
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

entity TB_D_FlipFlop is
end TB_D_FlipFlop;

architecture Behavioral of TB_D_FlipFlop is
signal clk_tb      : std_logic := '0';
signal reset_tb    : std_logic := '0';
signal D_in_tb     : std_logic := '0';
signal Q_tb        : std_logic := '0';
signal Q_not_tb    : std_logic := '0';

component D_FlipFlop
port (clk, reset, D_in : in std_logic;
      Q, Q_not : out std_logic 
      ); 
end component;

begin

uut : D_FlipFlop
    port map ( clk      => clk_tb,
               reset    => reset_tb,
               D_in     => D_in_tb,
               Q        => Q_tb,
               Q_not    => Q_not_tb
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
    reset_tb <= '1';
    wait for 20ns;
    reset_tb <= '0';
    
    D_in_tb <= '1';
    wait for 20ns;
    
    D_in_tb <= '0';
    wait for 20ns;
    
    wait;
end process;

end Behavioral;
