library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity controller_tb is
    end entity;

architecture test_bench of controller_tb is
    component controller is
        port(
                a : in STD_LOGIC_VECTOR(7 downto 0);
                b : in STD_LOGIC_VECTOR(7 downto 0);
                control : in STD_LOGIC_VECTOR(2 downto 0);
                overflow_flag : out STD_LOGIC;
                zero_flag : out STD_LOGIC;
                sign_flag : out STD_LOGIC;
                res : out STD_LOGIC_VECTOR(7 downto 0)
            );
    end component;
    signal a, b, res : STD_LOGIC_VECTOR(7 downto 0);
    signal control : STD_LOGIC_VECTOR(2 downto 0);
    signal overflow_flag : STD_LOGIC;
    signal zero_flag, sign_flag : STD_LOGIC;
begin
    mapping : controller port map (a, b, control, overflow_flag, zero_flag,
    sign_flag, res);

    a <= "01110000";
    b <= "10000000";
    control <= "000", "001" after 1 ns, "010" after 2 ns, "011" after 3 ns,
               "100" after 4 ns, "101" after 5 ns, "110" after 6 ns,
               "111" after 7 ns;
end test_bench;
