--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:00:27 02/17/2020
-- Design Name:   
-- Module Name:   C:/Users/tecdie/Desktop/Practica2/Practica_2_Project/tb_Habilitacion_7_seg.vhd
-- Project Name:  Practica_2_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Habilitacion_7_seg
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
 
ENTITY tb_Habilitacion_7_seg IS
END tb_Habilitacion_7_seg;
 
ARCHITECTURE behavior OF tb_Habilitacion_7_seg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Habilitacion_7_seg
    PORT(
         clk400hz : IN  std_logic;
         clear : IN  std_logic;
         hab_7_seg : OUT  std_logic_vector(3 downto 0);
         s : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk400hz : std_logic := '0';
   signal clear : std_logic := '0';

 	--Outputs
   signal hab_7_seg : std_logic_vector(3 downto 0);
   signal s : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk400hz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Habilitacion_7_seg PORT MAP (
          clk400hz => clk400hz,
          clear => clear,
          hab_7_seg => hab_7_seg,
          s => s
        );

   -- Clock process definitions
   clk400hz_process :process
   begin
		clk400hz <= '0';
		wait for clk400hz_period/2;
		clk400hz <= '1';
		wait for clk400hz_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
     -- hold reset state for 100 ns.
      wait for 100 ns;	
		clear <= '0';
      wait for clk400hz_period*10;
		clear <= '1';
      -- insert stimulus here
      wait;
   end process;
END;
