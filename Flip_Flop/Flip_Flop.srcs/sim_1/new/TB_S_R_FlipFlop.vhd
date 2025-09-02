----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/02/2025 09:50:42 PM
-- Design Name: 
-- Module Name: TB_S_R_FlipFlop - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_S_R_FlipFlop is
end TB_S_R_FlipFlop;

architecture Behavioral of TB_S_R_FlipFlop is
signal Set_tb     : std_logic := '0';
signal reset_tb     : std_logic := '0';
signal Q_tb     : std_logic := '0';
signal Q_Bar_tb : std_logic := '0';
signal clk_tb   : std_logic := '0';

component S_R_FlipFlop
Port ( set, reset, clk : in std_logic;
        Q, Q_Bar : out std_logic
     ); 
end component;

begin

uut : S_R_FlipFlop
    port map ( clk      => clk_tb,
               set      => Set_tb,
               reset    => reset_tb,
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
    Set_tb <= '1';
    wait for 20ns;
    
    reset_tb <= '1';
    wait for 20ns;
    
    Set_tb <= '0';
    wait for 20ns;
    
    reset_tb <= '0';
    wait for 20ns;

end process;
end Behavioral;
