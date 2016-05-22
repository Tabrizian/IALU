library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity full_subtractor_tb is
    end full_subtractor_tb;

architecture test_bench of full_subtractor_tb is
    component full_subtractor is
        port(
                a : in STD_LOGIC;
                b : in STD_LOGIC;
                bin : in STD_LOGIC;
                bout : out STD_LOGIC;
                sub : out STD_LOGIC
            );
    end component;
    signal a, b, bin : STD_LOGIC;
    signal arr : STD_LOGIC_VECTOR(2 downto 0);
begin
    bin <= arr(2);
    a   <= arr(1);
    b   <= arr(0);
    arr <= "000", "001" after 1 ns, "010" after 2 ns, "011" after 3 ns,
           "100" after 4 ns, "101" after 5 ns, "110" after 6 ns, "111" after 7 ns;
end test_bench;

