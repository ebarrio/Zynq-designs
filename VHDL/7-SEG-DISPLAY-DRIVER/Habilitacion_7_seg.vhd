----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:44:52 02/17/2020 
-- Design Name: 
-- Module Name:    Habilitacion_7_seg - Behavioral 
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

entity Habilitacion_7_seg is
    Port ( clk400hz : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           hab_7_seg : out  STD_LOGIC_VECTOR (3 downto 0);
           s : out  STD_LOGIC_VECTOR (1 downto 0));
end Habilitacion_7_seg;

architecture Behavioral of Habilitacion_7_seg is
	signal s_signal: std_logic_vector (1 downto 0);
	begin
		process(clear,clk400hz) 
		begin
			if(clear = '0') then
				s_signal <= (others =>'0');
			elsif(clk400hz'event and clk400hz = '1') then
				s_signal <= s_signal + 1;
			end if;
		end process;
		s<=s_signal;
		
		process(s_signal) 
		begin
			case s_signal is
			when "00" => hab_7_seg <="1110";
			when "01" => hab_7_seg <="1101";
			when "10" => hab_7_seg <="1011";
			when others => hab_7_seg <="0111";
		end case;
		end process;		

end Behavioral;

