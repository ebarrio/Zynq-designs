----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:38:10 02/17/2020 
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
    Port ( vis_cont : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           control : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           enable_seg : out  STD_LOGIC_VECTOR (3 downto 0);
           segmentos : out  STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is

signal wire_clk400hz : STD_LOGIC;
signal wire_clk1hz : STD_LOGIC;
signal wire_q : STD_LOGIC_VECTOR (15 downto 0);
signal wire_s : STD_LOGIC_VECTOR (1 downto 0);
signal wire_hab : STD_LOGIC_VECTOR (3 downto 0);
signal wire_bcd : STD_LOGIC_VECTOR (3 downto 0);

component RelojSec_1
    Port ( clear : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           clock400hz : out  STD_LOGIC);
end component;

component RelojSec_2
    Port ( clear : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           clock1hz : out  STD_LOGIC);
end component;

component Mux_4x1
    Port ( in_0 : in  STD_LOGIC_VECTOR (3 downto 0);
           in_1 : in  STD_LOGIC_VECTOR (3 downto 0);
           in_2 : in  STD_LOGIC_VECTOR (3 downto 0);
           in_3 : in  STD_LOGIC_VECTOR (3 downto 0);
			  s    : in  STD_LOGIC_VECTOR (1 downto 0);
           bcd : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Mux_2x1 is
    Port ( in_0 : in  STD_LOGIC_VECTOR (3 downto 0);
           in_1 : in  STD_LOGIC_VECTOR (3 downto 0);
           s : in  STD_LOGIC;
           enable_seg : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Habilitacion_7_seg
    Port ( clk400hz : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           hab_7_seg : out  STD_LOGIC_VECTOR (3 downto 0);
           s : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component Control_7_seg
    Port ( bcd : in  STD_LOGIC_VECTOR (3 downto 0);
           segmentos : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component ContadorUP_DOWN
    Port ( q : out  STD_LOGIC_VECTOR (15 downto 0);
           clear : in  STD_LOGIC;
           control : in  STD_LOGIC;
           clk1hz : in  STD_LOGIC);
end component;

begin
U0: RelojSec_1 port map(clear => clear, clock => clk, clock400hz => wire_clk400hz);
U1: RelojSec_2 port map(clear => clear, clock => clk, clock1hz => wire_clk1hz);
U2: Mux_4x1 port map(bcd => wire_bcd, in_0 => wire_q (15 downto 12), in_1 => wire_q (11 downto 8),in_2 => wire_q (7 downto 4), in_3 => wire_q (3 downto 0), s => wire_s);
U3: Mux_2x1 port map(in_0 => wire_hab, in_1 => "1111", s => vis_cont, enable_seg => enable_seg);
U4: Habilitacion_7_seg port map(clk400hz => wire_clk400hz, clear=> clear, s => wire_s, hab_7_seg => wire_hab);
U5: Control_7_seg port map(bcd => wire_bcd, segmentos => segmentos);
U6: ContadorUP_DOWN port map(clear => clear, control => control, clk1hz => wire_clk1hz, q => wire_q);

end Behavioral;

