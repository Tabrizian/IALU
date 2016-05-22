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
    signal res5 : STD_LOGIC_VECTOR(7 downto 0);
    signal a1 : STD_LOGIC_VECTOR(7 downto 0);
    signal a2 : STD_LOGIC_VECTOR(7 downto 0);
    signal a3 : STD_LOGIC_VECTOR(7 downto 0);
    signal a4 : STD_LOGIC_VECTOR(7 downto 0);
    signal a5 : STD_LOGIC_VECTOR(7 downto 0);

    signal b1 : STD_LOGIC_VECTOR(7 downto 0);
begin

    a1 <= "0000" & a(7 downto 4);
    b1 <= "0000" & b(7 downto 4) ;
    ss1 : select_subtractor port map(a1 , b1, res1, ovf);
    a2 <= "000" & res1(3 downto 0) & a(3);
    ss2 : select_subtractor port map(a2 , b1, res2, res(3));
    a3 <= "00" & res2(4 downto 0) & a(2);
    ss3 : select_subtractor port map(a3 , b1, res3, res(2));
    a4 <= '0' & res3(5 downto 0) & a(1);
    ss4 : select_subtractor port map(a4 , b1, res4, res(1));
    a5 <= res4(6 downto 0) & a(0);
    ss5 : select_subtractor port map(a5 , b1, res5, res(0));
end gate_level;
