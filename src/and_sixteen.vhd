library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity and_sixteen is
    port(A : in STD_LOGIC_VECTOR(15 downto 0);
         B : in STD_LOGIC_VECTOR(15 downto 0);
    ands :out STD_LOGIC_VECTOR(15 downto 0)
);
end and_sixteen;

architecture gate_level of and_sixteen is
begin
    ands <= A and B;
end gate_level;
