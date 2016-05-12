library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity or_sixteen is
    port(A : in STD_LOGIC_VECTOR(15 downto 0);
         B : in STD_LOGIC_VECTOR(15 downto 0);
    ors :out STD_LOGIC_VECTOR(15 downto 0)
);
end or_sixteen;

architecture gate_level of xor_sixteen is
begin
    ors <= A or B;
end gate_level;
