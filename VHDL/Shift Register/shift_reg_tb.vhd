library IEEE;
use IEEE.STD_LOGIC_1164.all;

library work;
use work.all;

entity shift_reg_tb is
-- Port();
end shift_reg_tb;

architecture Behavioral of shift_reg_tb is
    --Constants
    constant clk100Mhz_period : time := 10 ns;
    -- Signals
    signal clk : std_logic := '0';
    signal rst : std_logic;
    signal data_in : std_logic;
    signal data_out :std_logic_vector (7 downto 0);
begin
    clk <= not clk after clk100Mhz_period/2;
    -- Stimulus
    stim_proc : process
    begin
        rst <= '1';
        wait for 100 ns;
        rst <= '0';
        wait until rising_edge(clk);
        data_in <= '1';
        wait until rising_edge(clk);
        data_in <= '0';
        wait until rising_edge(clk);
        data_in <= '1';
        wait until rising_edge(clk);
        data_in <= '0';
        wait until rising_edge(clk);
        data_in <= '1';
        wait until rising_edge(clk);
        data_in <= '0';
        wait until rising_edge(clk);
        data_in <= '1';
        wait until rising_edge(clk);
        data_in <= '0';
        wait until rising_edge(clk);
        wait until rising_edge(clk);
        assert data_out = x"AA" report ("Failed");
        report "End of test" severity note;
        wait;
    end process;
    -- DUT
    shift_reg_inst : entity work.shift_reg
        port map(
          clk => clk,
          rst => rst,
          data_in => data_in,
          data_out => data_out  
        );
end Behavioral;