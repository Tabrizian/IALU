LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
    port (A,B:in STD_LOGIC;
    Sum,Cout:out STD_LOGIC);
end  half_adder;

architecture behavorial of half_adder is
begin
    sum<= A xor B;
    Cout<= A and B;
end behavorial;

