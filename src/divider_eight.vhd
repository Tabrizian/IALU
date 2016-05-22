library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity divider_eight is
    port(
            a : in STD_LOGIC_VECTOR(7 downto 0);
            b : in STD_LOGIC_VECTOR(7 downto 0);
            res : out STD_LOGIC_VECTOR(3 downto 0);
            ovf : out STD_LOGIC
        );

end divider_eight;

architecture gate_level of divider_eight is
    component select_subtractor is
        port(
                a : in STD_LOGIC_VECTOR(7 downto 0);
                b : in STD_LOGIC_VECTOR(7 downto 0);
                res : out STD_LOGIC_VECTOR(7 downto 0);
                bout : out STD_LOGIC
            );
    end component;
    signal res1 : STD_LOGIC_VECTOR(7 downto 0);
    signal res2 : STD_LOGIC_VECTOR(7 downto 0);
    signal res3 : STD_LOGIC_VECTOR(7 downto 0);
    signal res4 : STD_LOGIC_VECTOR(7 downto 0);
    signal a1 : STD_LOGIC_VECTOR(7 downto 0);
    signal a2 : STD_LOGIC_VECTOR(7 downto 0);
    signal a3 : STD_LOGIC_VECTOR(7 downto 0);
    signal a4 : STD_LOGIC_VECTOR(7 downto 0);
    signal a5 : STD_LOGIC_VECTOR(7 downto 0);

    signal b1 : STD_LOGIC_VECTOR(7 downto 0);
begin

    a1 <= a(7 downto 4) & "0000";
    b1 <= b(7 downto 4) & "0000";
    ss1 : select_subtractor port map(a1 , b1, res1, ovf);
    a2 <= res1(7 downto 4) & a(3) & "000";
    ss2 : select_subtractor port map(a2 , b1, res2, res(3));
    a3 <= res2(7 downto 3) & a(2) & "00";
    ss3 : select_subtractor port map(a3 , b1, res3, res(2));
    a4 <= res2(7 downto 2) & a(1) & "0";
    ss4 : select_subtractor port map(a4 , b1, res4, res(1));
    a4 <= res2(7 downto 1) & a(0);
    ss5 : select_subtractor port map(a4 , b1, res4, res(0));
end gate_level;
