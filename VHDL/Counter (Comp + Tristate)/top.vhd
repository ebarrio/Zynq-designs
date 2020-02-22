----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:45:35 02/21/2020 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity top is
    Port ( reset : in  STD_LOGIC;
           Up_Down : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Data_In : in  STD_LOGIC_VECTOR (2 downto 0);
           EN : in  STD_LOGIC;
           EN_LEDs : in  STD_LOGIC;
           Sal1 : out  STD_LOGIC;
           LEDs_out : out  STD_LOGIC_VECTOR (2 downto 0));
end top;

architecture Behavioral of top is

component Comparador
    Port ( q : in  STD_LOGIC_VECTOR (2 downto 0);
           Data_In : in  STD_LOGIC_VECTOR (2 downto 0);
           EN : in  STD_LOGIC;
           Comp_Out : out  STD_LOGIC);
end component;

component Contador_UP_DOWN
    Port ( reset : in  STD_LOGIC;
           Up_Down : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (2 downto 0));
end component;


component Inversores
    Port ( q : in  STD_LOGIC_VECTOR (2 downto 0);
           EN_LEDs : in  STD_LOGIC;
           LEDs_out : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

component MUX_8x1
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC_VECTOR (2 downto 0);
           Sal1 : out  STD_LOGIC);
end component;

signal clear_wire : STD_LOGIC;
signal q_wire : STD_LOGIC_VECTOR (2 downto 0);

begin
U1: Comparador PORT MAP (
           q => q_wire,
           Data_In => Data_In,
           EN => EN,
           Comp_Out => clear_wire
        );
U2: Contador_UP_DOWN PORT MAP (
           reset => reset,
           Up_Down => Up_Down,
           clear => clear_wire,
           clk => clk,
           q => q_wire
        );
U3: Inversores PORT MAP (
			  q => q_wire,
           EN_LEDs => EN_LEDs,
           LEDs_out => LEDs_out
        );
U4: MUX_8x1 PORT MAP (
			  D => "11001000",
           S => q_wire,
           Sal1 => Sal1
        );
end Behavioral;

