--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:24:13 02/17/2020
-- Design Name:   
-- Module Name:   C:/Users/tecdie/Desktop/Practica2/Practica_2_Project/tb_ContadorUP_DOWN.vhd
-- Project Name:  Practica_2_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ContadorUP_DOWN
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ContadorUP_DOWN IS
END tb_ContadorUP_DOWN;
 
ARCHITECTURE behavior OF tb_ContadorUP_DOWN IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ContadorUP_DOWN
    PORT(
         q : OUT  std_logic_vector(15 downto 0);
         clear : IN  std_logic;
         control : IN  std_logic;
         clk1hz : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clear : std_logic := '0';
   signal control : std_logic := '0';
   signal clk1hz : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk1hz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ContadorUP_DOWN PORT MAP (
          q => q,
          clear => clear,
          control => control,
          clk1hz => clk1hz
        );

   -- Clock process definitions
   clk1hz_process :process
   begin
		clk1hz <= '0';
		wait for clk1hz_period/2;
		clk1hz <= '1';
		wait for clk1hz_period/2;
   end process;
 

   -- Stimulus process (control, clear)
   stim_proc: process
   begin	
      -- hold reset state for 100 ns.
		clear <= '0';
      wait for 100 ns;	
		clear <= '1';
      wait for clk1hz_period*70000;
		control <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
