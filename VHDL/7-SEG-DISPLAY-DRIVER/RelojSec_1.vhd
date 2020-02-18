----------------------------------------------------------------------------------
-- Company: Würth y Celestica
-- Engineer: Iván Valcarcel y Eladio Barrio 
-- 
-- Create Date:    18:53:27 02/13/2020 
-- Design Name: 
-- Module Name:    RelojSec_1 - Behavioral 
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

entity RelojSec_1 is
    Port ( clear : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           clock400hz : out  STD_LOGIC);
end RelojSec_1;
architecture Behavioral of RelojSec_1 is
	signal count : STD_LOGIC_VECTOR (11 downto 0);
	signal max_count : STD_LOGIC_VECTOR (11 downto 0) := conv_std_logic_vector(1250,12);
	signal count_clock : STD_LOGIC;
	begin
		process(clock, clear) begin
		
			if(clear = '0') then
				count <= (others =>'0');
				count_clock <= '0';
			elsif(clock'event and clock = '1') then
			
				if (count >= max_count) then
					count <= (others =>'0');
					count_clock <= not(count_clock);
					
				else
					count <= count + 1;
				end if;
			else
			end if;
		end process;
			
		clock400hz <= count_clock;
end Behavioral;
		
			

