library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity divider_eight_tb is
    end entity;

architecture test_bench of divider_eight_tb is
    component divider_eight is
        port(
                a : in STD_LOGIC_VECTOR(7 downto 0);
                b : in STD_LOGIC_VECTOR(7 downto 0);
                res : out STD_LOGIC_VECTOR(3 downto 0);
                ovf : out STD_LOGIC
            );
    end component;
    signal a : STD_LOGIC_VECTOR(7 downto 0);
    signal b : STD_LOGIC_VECTOR(7 downto 0);
    signal res : STD_LOGIC_VECTOR(3 downto 0);
    signal ovf : STD_LOGIC;
begin
    a <= "00001111";
    b <= "00001100", "11110000" after 2 ns;
    mapping : divider_eight port map(a, b, res, ovf);

end test_bench;
