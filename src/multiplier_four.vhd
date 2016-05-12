library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity array_multiplier is
    port(a : in STD_LOGIC_VECTOR(3 downto 0);
         b : in STD_LOGIC_VECTOR(3 downto 0);
         ans : out STD_LOGIC_VECTOR(7 downto 0)
     );
end array_multiplier;

architecture dataflow of array_multiplier is

    component full_adder
        port (A,B,Cin:in std_logic;
        Sum,Cout:out STD_LOGIC);
    end component;

    component half_adder
        port (A,B:in STD_LOGIC;
        Sum,Cout:out STD_LOGIC);
    end component;

    signal aha1, bha1, cha1 : STD_LOGIC;
    signal aha2, bha2, cha2 : STD_LOGIC;
    signal aha3, bha3, cha3 : STD_LOGIC;
    signal aha4, bha4, cha4 : STD_LOGIC;

    signal afa2, bfa2, cfa2, sfa2 : STD_LOGIC;
    signal afa3, bfa3, cfa3, sfa3 : STD_LOGIC;
    signal afa31, bfa31, cfa31, sfa31 : STD_LOGIC;
    signal afa4, bfa4, cfa4, sfa4 : STD_LOGIC;
    signal afa5, bfa5, cfa5, sfa5 : STD_LOGIC;
    signal afa51, bfa51, cfa51, sfa51 : STD_LOGIC;
    signal afa6, bfa6, cfa6, sfa6 : STD_LOGIC;
    signal afa41, bfa41, cfa41, sfa41 : STD_LOGIC;


begin
    ans(0) <= a(0) and b(0);

    aha1 <= a(1) and b(0);
    bha1 <= a(0) and b(1);
    HA1 : half_adder port map(aha1, bha1, ans(1), cha1);

    afa2 <= a(2) and b(0);
    bfa2 <= a(1) and b(1);
    FA2 : full_adder port map(afa2, bfa2, cha1, sfa2, cfa2);

    bha2 <= a(0) and b(2);
    HA2 : half_adder port map(sfa2, bha2, ans(2), cha2);

    afa3 <= a(3) and b(0);
    bfa3 <= a(2) and b(1);
    FA3 : full_adder port map(afa3, bfa3, cfa2, sfa3, cfa3);

    afa31 <= a(1) and b(2);
    FA31 : full_adder port map(afa31, sfa3, cha2, sfa31, cfa31);

    bha3 <= a(0) and b(3);
    HA3 : half_adder port map(sfa31, bha3, ans(3), cha3);

    afa4 <= a(3) and b(1);
    bfa4 <= a(2) and b(2);
    FA4 : full_adder port map(afa4, bfa4, cfa3, sfa4, cfa4);

    afa41 <= a(1) and b(3);
    FA41 : full_adder port map(afa41, sfa4, cfa31, sfa41, cfa41);

    HA4 : half_adder port map(cha3, sfa41, ans(4), cha4);

    afa5 <= a(3) and b(2);
    FA5 : full_adder port map(afa5, cfa4, cfa41, sfa5, cfa5);

    afa51 <= a(2) and b(3);
    FA51 : full_adder port map(afa51, cha4, sfa5, ans(5), cfa51);

    afa6 <= a(3) and b(3);
    FA6 : full_adder port map(afa6, cfa5, cfa51, ans(6), ans(7));

end dataflow;
