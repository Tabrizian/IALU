LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
    port (A,B,Cin:in std_logic;
    Sum,Cout:out STD_LOGIC);
end full_adder;

architecture logic_gates of full_adder is
    signal s1,c1,c2:STD_LOGIC;

    component half_adder
        port(A, B:in STD_LOGIC;
        sum,cout:out STD_LOGIC);
    end component;
begin
    HA1: half_adder port map (A=>A ,B=>B,Sum=>S1,Cout=>c1);
    HA2: half_adder port map (A=>s1,B=>Cin,Sum=>Sum,Cout=>c2);
    cout <= c1 or c2;
end Logic_gates;
