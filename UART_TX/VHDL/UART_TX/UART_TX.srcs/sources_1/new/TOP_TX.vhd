----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2025 06:49:08 PM
-- Design Name: 
-- Module Name: TOP_TX - Behavioral
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


entity TOP_TX is
Port (
       clk : in std_logic;
       rst : in std_logic;
       tx : out std_logic
     );
end TOP_TX;

architecture Behavioral of TOP_TX is

signal tx_data : std_logic_vector (31 downto 0) := x"48656C6F";
signal tx_start : std_logic := '0';
signal tx_busy : std_logic;
signal start_pulse : std_logic := '0';
signal cnt : integer := 0; 

begin
    process (clk, rst)
    begin 
    if rst = '1' then 
        cnt <= 0;
        start_pulse <= '0';
    elsif rising_edge (clk) then
        if cnt = 100_000_000 then
            if tx_busy = '0' then
                start_pulse <= '1'; 
            end if;
                cnt <= 0; 
        else 
            start_pulse <= '0';
            cnt <= cnt + 1;
        end if;
     end if;
   end process;

process (clk, rst)
begin
     if rst = '1' then
        tx_start <= '0';
     elsif rising_edge(clk) then
        tx_start <= start_pulse;
     end if;
end process;

uart_tx_inst : entity work.UART_TX_9_MEI
    port map (
                clk_tx => clk,
                rst_tx => rst,
                tx_start => tx_start,
                tx_data => tx_data,
                data_tx => tx,
                tx_busy => tx_busy 
             );         
end Behavioral;
