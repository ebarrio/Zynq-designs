----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:26:51 02/21/2020 
-- Design Name: 
-- Module Name:    MUX_8x1 - Behavioral 
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

entity MUX_8x1 is
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC_VECTOR (2 downto 0);
           Sal1 : out  STD_LOGIC);
end MUX_8x1;

architecture Behavioral of MUX_8x1 is

begin
	process (D, S) begin
		case S is
			when "000"  => Sal1 <= D(0);
			when "001"  => Sal1 <= D(1);
			when "010"  => Sal1 <= D(2);
			when "011"  => Sal1 <= D(3);
			when "100"  => Sal1 <= D(4);
			when "101"  => Sal1 <= D(5);
			when "110"  => Sal1 <= D(6);
			when others => Sal1 <= D(7);
		end case;
	end process;
end Behavioral;

