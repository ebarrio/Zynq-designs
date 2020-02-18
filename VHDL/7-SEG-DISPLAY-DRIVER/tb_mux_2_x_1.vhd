--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:12:07 02/17/2020
-- Design Name:   
-- Module Name:   C:/Users/tecdie/Desktop/Practica2/Practica_2_Project/tb_mux_2_x_1.vhd
-- Project Name:  Practica_2_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux_2x1
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
 
ENTITY tb_mux_2_x_1 IS
END tb_mux_2_x_1;
 
ARCHITECTURE behavior OF tb_mux_2_x_1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_2x1
    PORT(
         in_0 : IN  std_logic_vector(3 downto 0);
         in_1 : IN  std_logic_vector(3 downto 0);
         s : IN  std_logic;
         enable_seg : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in_0 : std_logic_vector(3 downto 0) := (others => '0');
   signal in_1 : std_logic_vector(3 downto 0) := (others => '1');
   signal s : std_logic := '0';

 	--Outputs
   signal enable_seg : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_2x1 PORT MAP (
          in_0 => in_0,
          in_1 => in_1,
          s => s,
          enable_seg => enable_seg
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			s <= '1';
      wait;

      -- insert stimulus here 

      wait;
   end process;

END;
