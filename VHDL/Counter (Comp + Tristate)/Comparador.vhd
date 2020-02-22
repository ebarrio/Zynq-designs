----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:34:14 02/21/2020 
-- Design Name: 
-- Module Name:    Comparador - Behavioral 
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

entity Comparador is
    Port ( q : in  STD_LOGIC_VECTOR (2 downto 0);
           Data_In : in  STD_LOGIC_VECTOR (2 downto 0);
           EN : in  STD_LOGIC;
           Comp_Out : out  STD_LOGIC);
end Comparador;

architecture Behavioral of Comparador is

begin

process (q, Data_In, EN) begin
	if(EN = '0') then
		Comp_Out <= '0';
	else
		if(Data_In = q) then
			Comp_Out <= '1';
		else
			Comp_Out <= '0';
		end if;
	end if;
end process;
end Behavioral;

