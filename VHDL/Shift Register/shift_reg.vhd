library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity shift_reg is
    port (
        clk : in std_logic;
        rst : in std_logic;
        data_in : in std_logic;
        data_out : out std_logic_vector (7 downto 0)
    );
end shift_reg;

architecture Behavioral of shift_reg is
    signal internal_reg : std_logic_vector (7 downto 0);
begin
    data_out <= internal_reg;
    process (clk, rst)
    begin
        if rst = '1' then
            internal_reg <= (others => '0');
        else
            if rising_edge(clk) then
                internal_reg (0) <= data_in;
                internal_reg (7 downto 1) <= internal_reg (6 downto 0);
            end if;
        end if;
    end process;
end Behavioral;
