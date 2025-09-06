library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TOP_RX is
    Port (
        clk : in std_logic;
        reset : in std_logic;
        rx : in std_logic;
        leds : out std_logic_vector(7 downto 0)
    );
end TOP_RX;

architecture Behavioral of TOP_RX is

    signal rx_ready : std_logic;
    signal rx_data  : std_logic_vector(31 downto 0);

    component UART_RX_LAMA
        Port (
            clk : in std_logic;
            reset : in std_logic;
            rx : in std_logic;
            rx_ready : out std_logic;
            rx_data : out std_logic_vector(31 downto 0)
        );
    end component;

begin

    uart_rx_inst : UART_RX_LAMA
        Port map (
            clk => clk,
            reset => reset,
            rx => rx,
            rx_ready => rx_ready,
            rx_data => rx_data
        );

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                leds <= (others => '0');
            else
                -- Update LEDs
                if rx_ready = '1' then
                    leds <= rx_data(7 downto 0);
                end if;
            end if;
        end if;
    end process;

end Behavioral;
