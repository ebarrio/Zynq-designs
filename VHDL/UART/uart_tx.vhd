library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity uart_tx is
    Port ( clk : in std_logic;
           reset : in std_logic;
           tx : out std_logic;
           led_o : out std_logic);
end uart_tx;

architecture Behavioral of uart_tx is
    signal clk_div : std_logic;
    signal clk_counter : integer range 0 to 5207;
    signal tx_bit : integer range 0 to 7;
    type tx_state_t is (IDLE, START, DATA, STOP);
    signal tx_state : tx_state_t;

    signal char_tx : std_logic_vector (7 downto 0);
    signal char_pointer : integer range 0 to 10;
begin

------------------------------------------
--- ROM almacena texto a enviar
------------------------------------------
    process (char_pointer)
        begin
            case (char_pointer) is
                when 0 =>
                    char_tx <= conv_std_logic_vector(character'pos('H'),8);
                when 1 =>
                    char_tx <= conv_std_logic_vector(character'pos('o'),8);
                when 2 =>
                    char_tx <= conv_std_logic_vector(character'pos('l'),8);
                when 3 =>
                    char_tx <= conv_std_logic_vector(character'pos('a'),8);
                when 4 =>
                    char_tx <= conv_std_logic_vector(character'pos(' '),8);
                when 5 =>
                    char_tx <= conv_std_logic_vector(character'pos('m'),8);
                when 6 =>
                    char_tx <= conv_std_logic_vector(character'pos('u'),8);
                when 7 =>
                    char_tx <= conv_std_logic_vector(character'pos('n'),8);
                when 8 =>
                    char_tx <= conv_std_logic_vector(character'pos('d'),8);
                when 9 =>
                    char_tx <= conv_std_logic_vector(character'pos('o'),8);
                when 10 =>
                    char_tx <= conv_std_logic_vector(character'pos('!'),8);
                when others =>
                    char_tx <= (others => '0');
            end case;
    end process;

------------------------------------------
--- Divisor de freq. 100 Mhz a 9600 bps
------------------------------------------
    process (clk, reset) begin
        if (reset ='1') then
            clk_div <= '0';
        elsif (rising_edge (clk)) then
            if (clk_counter = 5207) then
                clk_div <= not(clk_div);
                clk_counter <= 0;
            else
                clk_counter <= clk_counter + 1;
            end if;
        else
        end if;
    end process;

------------------------------------------------------------
--- Maquina de estados: lectura de ROM y serializa el dato
------------------------------------------------------------
process (clk_div, reset) begin
    if (reset = '1') then
        tx <= '1';
        tx_state <= IDLE;
        tx_bit <= 0;
        led_o <= '0';
        char_pointer <= 0;
    elsif(rising_edge (clk_div)) then
        case (tx_state) is
            when IDLE =>
                tx <= '1';
                tx_bit <= 0;
                tx_state <= START;
            when START =>
                tx <= '0';
                tx_state <= DATA;
            when DATA =>
                tx <= char_tx(tx_bit);
                if(tx_bit = 7) then
                    tx_state <= STOP;
                else
                    tx_bit <= tx_bit + 1;
                end if;
            when STOP =>
                tx <= '1';
                if(char_pointer = 10) then
                    led_o <= '1';
                else
                    tx_state <= IDLE;
                    char_pointer <= char_pointer + 1;
                end if;
            end case;
        end if;
    end process;
end Behavioral;