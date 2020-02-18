--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:46:17 02/13/2020
-- Design Name:   
-- Module Name:   C:/Practica2/Practica_2_Project/tb_RelojSec_1.vhd
-- Project Name:  Practica_2_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RelojSec_1
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
 
ENTITY tb_RelojSec_1 IS
END tb_RelojSec_1;
 
ARCHITECTURE behavior OF tb_RelojSec_1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RelojSec_1
    PORT(
         clear : IN  std_logic;
         clock : IN  std_logic;
         clock400hz : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clear : std_logic := '0';
   signal clock : std_logic := '0';

 	--Outputs
   signal clock400hz : std_logic;

   -- Clock period definitions
   constant clock_period : time := 5 ns;
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RelojSec_1 PORT MAP (
          clear => clear,
          clock => clock,
          clock400hz => clock400hz
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		clear <= '0';
      wait for clock_period*10;
		clear <= '1';
      -- insert stimulus here
      wait;
   end process;

END;
