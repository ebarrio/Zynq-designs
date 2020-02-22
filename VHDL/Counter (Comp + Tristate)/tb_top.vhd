--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:09:12 02/21/2020
-- Design Name:   
-- Module Name:   C:/Users/Alumno/Desktop/Examen_E_Barrio_I_Valcarcel/Prj_Exam_Eladio_Ivan/tb_top.vhd
-- Project Name:  Prj_Exam_Eladio_Ivan
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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
 
ENTITY tb_top IS
END tb_top;
 
ARCHITECTURE behavior OF tb_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         reset : IN  std_logic;
         Up_Down : IN  std_logic;
         clk : IN  std_logic;
         Data_In : IN  std_logic_vector(2 downto 0);
         EN : IN  std_logic;
         EN_LEDs : IN  std_logic;
         Sal1 : OUT  std_logic;
         LEDs_out : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '1';
   signal Up_Down : std_logic := '1';
   signal clk : std_logic := '0';
   signal Data_In : std_logic_vector(2 downto 0) := "101";
   signal EN : std_logic := '1';
   signal EN_LEDs : std_logic := '1';

 	--Outputs
   signal Sal1 : std_logic;
   signal LEDs_out : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          reset => reset,
          Up_Down => Up_Down,
          clk => clk,
          Data_In => Data_In,
          EN => EN,
          EN_LEDs => EN_LEDs,
          Sal1 => Sal1,
          LEDs_out => LEDs_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '0';
      wait for clk_period*10;
		Up_Down <= '0';
		wait for clk_period*10;
		EN_LEDs <= '0';
		wait for clk_period*10;
		Up_Down <= '1';
		wait for clk_period*10;
		reset <= '1';
		wait for clk_period*10;
		reset <= '0';
		wait for clk_period*10;
		EN <= '0';
		wait for clk_period*10;
		EN <= '1';
		wait for clk_period*10;
		Data_In <= "011";
		wait for clk_period*10;
		Up_Down <= '0';
		
      -- insert stimulus here 

      wait;
   end process;

END;
