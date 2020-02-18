--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:21:10 02/17/2020
-- Design Name:   
-- Module Name:   C:/Users/tecdie/Desktop/Practica2/Practica_2_Project/tb_Mux_4x1.vhd
-- Project Name:  Practica_2_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux_4x1
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
 
ENTITY tb_Mux_4x1 IS
END tb_Mux_4x1;
 
ARCHITECTURE behavior OF tb_Mux_4x1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_4x1
    PORT(
         in_0 : IN  std_logic_vector(3 downto 0);
         in_1 : IN  std_logic_vector(3 downto 0);
         in_2 : IN  std_logic_vector(3 downto 0);
         in_3 : IN  std_logic_vector(3 downto 0);
         s : IN  std_logic_vector(1 downto 0);
         bcd : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in_0 : std_logic_vector(3 downto 0) := (others => '0');
   signal in_1 : std_logic_vector(3 downto 0) := "0011";
   signal in_2 : std_logic_vector(3 downto 0) := "1100";
   signal in_3 : std_logic_vector(3 downto 0) := (others => '1');
   signal s : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal bcd : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_4x1 PORT MAP (
          in_0 => in_0,
          in_1 => in_1,
          in_2 => in_2,
          in_3 => in_3,
          s => s,
          bcd => bcd
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
			wait for 100 ns;	
			s <= "00";
			wait for 100 ns;	
			s <= "01";
			wait for 100 ns;	
			s <= "10";
			wait for 100 ns;	
			s <= "11";
      -- insert stimulus here 

			wait;
   end process;

END;
