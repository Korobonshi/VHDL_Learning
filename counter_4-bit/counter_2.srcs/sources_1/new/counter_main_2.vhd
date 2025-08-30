----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Septian Fajar Megantara
-- 
-- Create Date: 30/08/2025 05:26:25 PM
-- Design Name: 
-- Module Name: counter_main
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description:  
--      This is just a simple counter that will function as a 4-bit,
--      synchronous, resettable, up/down counter. The design features an active-high
--      asynchronous reset. The counting sequence is controlled by the up_down
--      input and is triggered on the rising_edge(clk). The up-count sequence
--      is a standard modulo-16(0 to 15).
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_main is
Port (clk, reset, up_down : in std_logic;
      count : out std_logic_vector (3 downto 0) 
      );
end counter_main;

architecture Behavioral of counter_main is
signal counter : unsigned (3 downto 0) := (others => '0');
begin
    process (clk, reset)
    begin
        if reset = '1' then
            counter <= (others => '0');
        elsif rising_edge(clk) then
            if up_down = '1' then
                if counter = "1111" then
                    counter <= (others => '0');
                 else
                    counter <= counter + 1;
                 end if;
            else 
                if counter = "0000" then
                    counter <= (others => '1');
                 else 
                    counter <= counter - 1;
                 end if;
            end if;
         end if;
    end process;
    
    count <= std_logic_vector(counter);
    
end Behavioral;

