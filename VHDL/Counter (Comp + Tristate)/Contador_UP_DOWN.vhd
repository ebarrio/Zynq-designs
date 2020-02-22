----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:13:29 02/21/2020 
-- Design Name: 
-- Module Name:    Contador_UP_DOWN - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Contador_UP_DOWN is
    Port ( reset : in  STD_LOGIC;
           Up_Down : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (2 downto 0));
end Contador_UP_DOWN;

architecture Behavioral of Contador_UP_DOWN is
	signal q_signal : STD_LOGIC_VECTOR (2 downto 0);
begin
	process (clk, reset, Up_Down) begin
		if (reset = '1') then
			q_signal <= (others => '0');
		elsif(clk'event and clk = '1') then
			if(clear = '1') then
				q_signal <= (others => '0');
			else
				if (Up_Down = '1') then
					q_signal <= q_signal + 1;
				else
					q_signal <= q_signal - 1;
				end if;
			end if;
		end if;
	end process;
	q <= q_signal;
end Behavioral;

