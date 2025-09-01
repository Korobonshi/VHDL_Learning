library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_AND is
end TB_AND;

architecture Behavioral of TB_AND is

signal clk_tb : std_logic;
signal reset_tb : std_logic;
signal a_tb : std_logic;
signal b_tb : std_logic;
signal c_tb : std_logic;

constant clk_period : time := 10ns;
 
begin

uut : entity work.DAY_1_AND
port map(
    a => a_tb,
    b => b_tb,
    c => c_tb
    ); 

clock_process : process
begin 
    while now < 1ms loop
        clk_tb <= '0';
        wait for clk_period/2;
        clk_tb <= '1';
        wait for clk_period/2;
     end loop;
     wait;
end process;

stim_proc : process
begin
    wait for 50ns;
    reset_tb <= '0';
    
    --- test 1 ---
    a_tb <= '0';
    b_tb <= '1';
    wait for 10ns;
    
    --- test 2 ---
    a_tb <= '1';
    b_tb <= '1';
    wait for 10ns;
    wait;
end process;
    
end Behavioral;
