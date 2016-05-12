LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ripple_sixteen_adder is
    port (A,B:in STD_LOGIC_VECTOR(15 downto 0);
          sum:out STD_LOGIC_VECTOR(15 downto 0);
          cout:out STD_LOGIC;
          command:in STD_LOGIC);
end ripple_sixteen_adder;

architecture gate_level_implementation of ripple_sixteen_adder is
    component full_adder is
        port( A, B, Cin :in std_logic;
        sum ,Cout :out std_logic);
    end component;

    signal cout_mid : STD_LOGIC_VECTOR(15 downto 0);
    signal C : STD_LOGIC_VECTOR(15 downto 0);
    signal Cin : STD_LOGIC;
begin
    C <= B when command = '0' else
         not B when command = '1';

    Cin <= '1' when command = '1' else
           '0' when command = '0';

    FA1: full_adder port map(A=>A(0), B=>C(0), Cin=>Cin, sum=>sum(0), cout=>cout_mid(0));

    GEN_REG: for I in 1 to 15 generate
        FA : full_adder port map(A=>A(I), B=>C(I), Cin=>cout_mid(I-1), sum=>sum(I), cout=>cout_mid(I));
    end generate GEN_REG;

    cout <= cout_mid(15);

end gate_level_implementation;
