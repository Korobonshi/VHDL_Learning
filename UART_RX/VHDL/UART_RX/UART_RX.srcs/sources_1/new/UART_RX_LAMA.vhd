library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity UART_RX_LAMA is
Port (
       clk : in std_logic;
       reset : in std_logic;
       rx : in std_logic;
       rx_ready : out std_logic;
       rx_data : out std_logic_vector(31 downto 0)
     );
end UART_RX_LAMA;

architecture Behavioral of UART_RX_LAMA is

-- frekuensi dan baud rate yang disesuaikan dengan board artix-7
constant CLK_FREQ : integer := 100_000_000;
constant BAUD_RATE : integer := 115200;
constant TICKS_PER_BIT : integer := CLK_FREQ / BAUD_RATE; -- counter = 868

-- state untuk implementasi FSM (state machine) model moore
type state_type is (IDLE, START, DATA, STOP);
signal state : state_type := IDLE;

-- Proses internal untuk mengatur 
signal rx_reg   : std_logic := '1'; -- untuk mendeteksi perubahan aktif atau tidaknya pin RX
signal rx_sync  : std_logic := '1'; -- sinkronisasi pengambilan data dari pin dengan clock

signal bit_count : integer range 0 to 31 := 0;                           -- untuk menghitung berapa bit yang sudah diterima
signal baud_counter : integer := 0;                                      -- sebagai timer kecil untuk pengambilan bit berikutnya
signal rx_shift_reg : std_logic_vector (31 downto 0) := (others => '0'); -- menyimpan bit yang sudah diterima
signal data_ready : std_logic := '0';                                    -- sebagai penanda kalau bit yang disimpan sudah lengkap

begin
    process(clk, reset)
        begin
            if reset = '1' then
                state <= IDLE;
                baud_counter <= 0;
                bit_count <= 0;
                rx_shift_reg <= (others => '0'); -- untuk menyimpan data yang masuk
                data_ready <= '0';
                rx_reg <= '1'; -- nilainya 1 karena saat tidak ada data dikirim pin TX dan RX akan tetap HIGH
                rx_sync <= '1'; 
            elsif falling_edge(clk) then 
                rx_sync <= rx;
                rx_reg <= rx_sync;
                data_ready <= '0'; -- mengisyaratkan apakah data sudah diterima atau belum
                    case state is
                        when IDLE => 
                            if rx_reg = '0' then
                                baud_counter <= TICKS_PER_BIT / 2; -- counter = 434
                                state <= START; -- kondisi START baru akan dilaksanakan jika rx_reg mendeteksi perubahan pada pin RX dari 1 ke 0 
                            end if;
                            
                        when START => 
                            if baud_counter = 0 then
                                if rx_reg = '0' then
                                    bit_count <= 0;
                                    baud_counter <= TICKS_PER_BIT; -- counter = 868
                                    state <= DATA; -- Pindah ke kondisi Data
                                else
                                    state <= IDLE;
                                end if;
                           else
                                baud_counter <= baud_counter - 1; -- counter yang masuk bernilai 434, akan dikurangi menjadi 0
                           end if;
                                                                   
                        when DATA => 
                            if baud_counter = 0 then
                                rx_shift_reg(bit_count) <= rx_reg; -- menerima data yang masuk, contoh rx_shift_reg(1) = 0, rx_shift_reg(2) = 1, dst, bit_count dimulai dari 0 
                                if bit_count = 31 then
                                    state <= STOP;
                                else 
                                    bit_count <= bit_count + 1;
                                end if;
                                baud_counter <= TICKS_PER_BIT;
                            else
                                baud_counter <= baud_counter  - 1; -- counter yang masuk bernilai 868, akan dikurangi menjadi 0
                            end if;
                                
                        when STOP =>
                            if baud_counter = 0 then
                                if rx_reg = '1' then
                                    data_ready <= '1'; -- mengisyaratkan data sudah diterima semua
                                end if;
                                    state <= IDLE;
                            else 
                                baud_counter <= baud_counter - 1;
                            end if;
                    end case;
                end if;
     end process;
     
     rx_data <= rx_shift_reg; -- Mengirim data yang diterima ke port output
     rx_ready <= data_ready;   

end Behavioral;
