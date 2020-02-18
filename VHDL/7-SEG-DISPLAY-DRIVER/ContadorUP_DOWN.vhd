----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:11:28 02/13/2020 
-- Design Name: 
-- Module Name:    ContadorUP_DOWN - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ContadorUP_DOWN is
    Port ( q : out  STD_LOGIC_VECTOR (15 downto 0);
           clear : in  STD_LOGIC;
           control : in  STD_LOGIC;
           clk1hz : in  STD_LOGIC);
end ContadorUP_DOWN;

architecture Behavioral of ContadorUP_DOWN is
	signal q_signal: std_logic_vector (15 downto 0);
	begin
	process(clk1hz ,control ,clear)
	
	begin
		if(clear = '0') then
			q_signal <= (others =>'0');
		elsif(clk1hz'event and clk1hz = '1') then
			if (control='0') then
				q_signal <= q_signal + 1;
			else
				q_signal <= q_signal - 1;
			end if;
		end if;
	end process;
	q <= q_signal;
end Behavioral;

