library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_UART_TX is
end TB_UART_TX;

architecture Behavioral of TB_UART_TX is
signal clk_tb : std_logic := '0';
signal rst_tb : std_logic := '0';
signal tx_start_tb : std_logic := '0';
signal tx_data_tb : std_logic_vector (31 downto 0) := (others => '0');
signal tx_busy_tb : std_logic;
signal data_tx_tb : std_logic;

constant clk_period : time := 10ns;

begin
uut : entity work.UART_TX_9_MEI
    port map (  clk_tx => clk_tb, 
                rst_tx => rst_tb,
                tx_start => tx_start_tb,
                tx_data => tx_data_tb,
                tx_busy => tx_busy_tb,
                data_tx => data_tx_tb
             );
             
             
clk_process : process 
begin 
   while now <= 5ms loop
        clk_tb <= '0';
        wait for clk_period/2;
        clk_tb <= '1';
        wait for clk_period/2;
   end loop;
   wait;
end process;



stim_proc : process
begin
    rst_tb <= '1';
    wait for 100 ns;
    rst_tb <= '0';
    
    wait for 1000ns;
    
    
    tx_data_tb <= x"55AACCF0";  -- Data 32-bit = 0b01010101_10101010_11001100_11110000
    tx_start_tb <= '1';
    
    wait for clk_period;
    tx_start_tb <= '0';
    
    wait until tx_busy_tb = '0';
    
    wait;
    
 end process;
      
end Behavioral;
