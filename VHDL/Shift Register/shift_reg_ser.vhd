library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity shift_reg_ser is
    port (
        clk : in std_logic;
        rst : in std;
        data_in_valid : in std_logic;
        data_in : in std_logic_vector (7 downto 0);
        data_out : out std_logic
    );
end shift_reg_ser;

architecture Behavioral of shift_reg_ser is
    signal intern_reg : std_logic_vector(7 downto 0);
begin
    data_out <= internal_reg (7);
    process (clk, rst)
        variable start : boolean := False;
    begin
        if rst = '1' then
            internal_reg <= (others => '0');
        else
            if rising_edge(clk) then
                if data_in_valid = '1' then
                    internal_reg <= data_in;
                    start := True;
                else
                    internal_reg (7 downto 1) <= internal_reg(6 downto 0);
                end if;
            end if;
        end if;
    end process;
end Behavioral;