library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_OR is
end TB_OR;

architecture Behavioral of TB_OR is
signal a_tb : std_logic;
signal b_tb : std_logic;
signal c_tb : std_logic;

begin
uut : entity work.DAY_1_OR
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
