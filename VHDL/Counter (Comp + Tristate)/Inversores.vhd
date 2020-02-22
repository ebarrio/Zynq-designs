----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:41:45 02/21/2020 
-- Design Name: 
-- Module Name:    Inversores - Behavioral 
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

entity Inversores is
    Port ( q : in  STD_LOGIC_VECTOR (2 downto 0);
           EN_LEDs : in  STD_LOGIC;
           LEDs_out : out  STD_LOGIC_VECTOR (2 downto 0));
end Inversores;

architecture Behavioral of Inversores is

begin
process (q, EN_LEDs) begin
	if(EN_LEDs = '0') then
		LEDs_out <= (others => 'Z');
	else
		LEDs_out <= not(q);
	end if;
end process;
end Behavioral;

