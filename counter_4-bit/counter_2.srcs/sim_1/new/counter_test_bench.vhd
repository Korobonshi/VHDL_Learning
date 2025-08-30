----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Septian Fajar Megantara
-- 
-- Create Date: 30/08/2025 05:26:25 PM
-- Design Name: 
-- Module Name: DDFS_TOP - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity counter_test_bench is
end counter_test_bench;
 
architecture Behavioral of counter_test_bench is
    component counter_main
        Port (clk, reset, up_down : in std_logic;
          count : out std_logic_vector (3 downto 0)
          );
     end component;
     
     signal clk : std_logic := '0';
     signal reset : std_logic := '0';
     signal up_down : std_logic := '0';
     signal count : std_logic_vector (3 downto 0);
    
begin
    
    uut : counter_main
        port map(
        clk => clk,
        reset => reset,
        up_down => up_down,
        count => count
        );
    
    clk_process : process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process; 
    
    stimulus_process : process
    begin
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        
        up_down <= '1';
        wait for 500 ns;
        
        up_down <= '0';
        wait for 500 ns;                                
        wait;
     end process;
end Behavioral;
