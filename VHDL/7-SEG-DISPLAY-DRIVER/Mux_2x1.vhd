----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:07:37 02/17/2020 
-- Design Name: 
-- Module Name:    Mux_2x1 - Behavioral 
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

entity Mux_2x1 is
    Port ( in_0 : in  STD_LOGIC_VECTOR (3 downto 0);
           in_1 : in  STD_LOGIC_VECTOR (3 downto 0);
           s : in  STD_LOGIC;
           enable_seg : out  STD_LOGIC_VECTOR (3 downto 0));
end Mux_2x1;

architecture Behavioral of Mux_2x1 is
	
begin
	with s select
		enable_seg <= in_0 when '0',
						  in_1 when others;

end Behavioral;

