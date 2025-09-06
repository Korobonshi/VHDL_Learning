----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2025 02:47:12 PM
-- Design Name: 
-- Module Name: UART_TX_9_MEI - Behavioral
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


entity UART_TX_9_MEI is
Port (clk_tx, rst_tx : in std_logic;
      tx_start : in std_logic;
      tx_data : in std_logic_vector (31 downto 0);
      tx_busy : out std_logic;
      data_tx : out std_logic
 );
 
end UART_TX_9_MEI;

architecture Behavioral of UART_TX_9_MEI is

-- frekuensi dan baud rate yang disesuaikan dengan board artix-7
constant CLK_FREQ : integer := 100_000_000;
constant BAUD_RATE : integer := 115200;
constant BAUD_TICK : integer := CLK_FREQ / BAUD_RATE; 

 
type state_type is (IDLE, START_BIT, DATA_PROCESS, STOP_BIT);
signal state : state_type := IDLE; -- Memastikan sistem agar dimulai dari IDLE ketika pertama berjalan

signal tx_busy_int : std_logic;

-- untuk pengiriman 32 bit -> dipecah menjadi 4 byte (8 bit)
signal word_cnt : integer range 0 to 3 := 0; -- 4 byte 
signal bit_cnt : integer range 0 to 7 := 0;  -- 8 bit
signal baud_cnt : integer := 0;

begin 
 process (clk_tx, rst_tx)
begin
    if rst_tx = '1' then
        state <= IDLE;
        bit_cnt <= 0;
        word_cnt <= 0;
        baud_cnt <= 0;
        data_tx <= '1';
    elsif rising_edge(clk_tx) then
        case state is
            when IDLE =>
                data_tx <= '1';
                if tx_start = '1' then
                    word_cnt <= 0;
                    bit_cnt <= 0;
                    baud_cnt <= 0;
                    state <= START_BIT;
                end if;

            when START_BIT =>
                data_tx <= '0';
                if baud_cnt = BAUD_TICK - 1 then
                    baud_cnt <= 0;
                    state <= DATA_PROCESS;
                else
                    baud_cnt <= baud_cnt + 1;
                end if;

            when DATA_PROCESS =>
                data_tx <= tx_data((word_cnt * 8) + bit_cnt);
                if baud_cnt = BAUD_TICK - 1 then
                    baud_cnt <= 0;
                    if bit_cnt = 7 then
                        bit_cnt <= 0;
                        state <= STOP_BIT;
                    else
                        bit_cnt <= bit_cnt + 1;
                    end if;
                else
                    baud_cnt <= baud_cnt + 1;
                end if;

            when STOP_BIT =>
                data_tx <= '1';
                if baud_cnt = BAUD_TICK - 1 then
                    baud_cnt <= 0;
                    if word_cnt = 3 then
                        state <= IDLE;
                    else
                        word_cnt <= word_cnt + 1;
                        state <= START_BIT;
                    end if;
                else
                    baud_cnt <= baud_cnt + 1;
                end if;
        end case;
    end if;
end process;

tx_busy_int <= '1' when state /= IDLE else '0';
tx_busy <= tx_busy_int;
 
end Behavioral;
