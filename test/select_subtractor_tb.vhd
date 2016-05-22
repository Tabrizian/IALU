library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity select_subtractor_tb is
    end entity;

architecture test_bench of select_subtractor_tb is
    component select_subtractor is
        port(
                a : in STD_LOGIC_VECTOR(3 downto 0);
                b : in STD_LOGIC_VECTOR(3 downto 0);
                res : out STD_LOGIC_VECTOR(3 downto 0);
                bout : out STD_LOGIC
            );
    end component;

    signal a, b, res : STD_LOGIC_VECTOR(3 downto 0);
    signal bout : STD_LOGIC;
begin
    mapping : select_subtractor port map(a, b, res, bout);
    a <= "1000";
    b <= "1001";
end test_bench;
