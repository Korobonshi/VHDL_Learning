--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:36:42 09/23/2024
-- Design Name:   
-- Module Name:   /home/ise/ADDER/FULL_ADDER_32_Bit_TestBench.vhd
-- Project Name:  ADDER
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FULL_ADDER_32_Bit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY FULL_ADDER_32_Bit_TestBench IS
END FULL_ADDER_32_Bit_TestBench;
 
ARCHITECTURE behavior OF FULL_ADDER_32_Bit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FULL_ADDER_32_Bit
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Cin : IN  std_logic;
         Sum : OUT  std_logic_vector(31 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Sum : std_logic_vector(31 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.FULL_ADDER_32_Bit port map(A => A,
															  B => B,
															  Cin => Cin,
															  Sum => Sum,
															  Cout => Cout);

   -- Stimulus process
   stim_proc: process
   begin		
		-- test case 1 A = 10, B = 20
		A <= "00000000000000000000000000000010";
		B <= "00000000000000000000000000000010";
		Cin <= '0';
		wait for 10ns;
		
   end process;

END;