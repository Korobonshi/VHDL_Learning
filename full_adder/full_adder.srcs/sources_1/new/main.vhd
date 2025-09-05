library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FULL_ADDER_32_Bit is
port (  A : in std_logic_vector (31 downto 0);
		B : in std_logic_vector (31 downto 0);
		Cin : in std_logic;
		sum : out std_logic_vector (31 downto 0);
		cout : out std_logic);
end FULL_ADDER_32_Bit;

architecture Behavioral of FULL_ADDER_32_Bit is
signal Carry : std_logic_vector (31 downto 0);
begin

sum_32_bit : entity work.FULL_ADDER_1_Bit port map(A(0), B(0), Cin, Sum(0), Carry(0));

adders : for i in 1 to 31 generate
	sum_32_bit_adders : entity work.FULL_ADDER_1_Bit port map(A(i), B(i), Carry(i - 1), Sum(i), Carry(i));
end generate;

Cout <= Carry (31);
end Behavioral;