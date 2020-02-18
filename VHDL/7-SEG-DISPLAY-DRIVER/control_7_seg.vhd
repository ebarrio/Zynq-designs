----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:32:19 02/17/2020 
-- Design Name: 
-- Module Name:    Control_7_seg - Behavioral 
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

entity Control_7_seg is
    Port ( bcd : in  STD_LOGIC_VECTOR (3 downto 0);
           segmentos : out  STD_LOGIC_VECTOR (7 downto 0));
end Control_7_seg;

architecture Behavioral of Control_7_seg is

begin

process(bcd)
begin
    case bcd is
    when "0000" => segmentos <= "11000000"; -- "0"     
    when "0001" => segmentos <= "11111001"; -- "1" 
    when "0010" => segmentos <= "10100100"; -- "2" 
    when "0011" => segmentos <= "10110000"; -- "3" 
    when "0100" => segmentos <= "10011001"; -- "4" 
    when "0101" => segmentos <= "10010010"; -- "5" 
    when "0110" => segmentos <= "10000010"; -- "6" 
    when "0111" => segmentos <= "11111000"; -- "7" 
    when "1000" => segmentos <= "10000000"; -- "8"     
    when "1001" => segmentos <= "10010000"; -- "9" 
    when "1010" => segmentos <= "10001000"; -- a
    when "1011" => segmentos <= "10000011"; -- b
    when "1100" => segmentos <= "11000110"; -- C
    when "1101" => segmentos <= "10100001"; -- d
    when "1110" => segmentos <= "10001100"; -- E
    when others => segmentos <= "10001110"; -- F
    end case;
end process;

end Behavioral;

