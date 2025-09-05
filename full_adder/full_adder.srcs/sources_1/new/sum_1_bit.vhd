----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:31:19 09/23/2024 
-- Design Name: 
-- Module Name:    FULL_ADDER_1_Bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FULL_ADDER_1_Bit is
port (A : IN STD_LOGIC;
		B : IN STD_LOGIC;
		Cin : IN STD_LOGIC;
		Sum : Out STD_LOGIC;
		Cout : Out STD_LOGIC);
end FULL_ADDER_1_Bit;

architecture Behavioral of FULL_ADDER_1_Bit is

begin
Sum <= (A XOR B XOR Cin);
Cout <= (B and Cin) Or (A and B) Or (A and Cin);

end Behavioral;