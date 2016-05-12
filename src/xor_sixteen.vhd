library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity xor_sixteen is
    port(A : in STD_LOGIC_VECTOR(15 downto 0);
         B : in STD_LOGIC_VECTOR(15 downto 0);
    xors :out STD_LOGIC_VECTOR(15 downto 0)
);
end xor_sixteen;

architecture gate_level of xor_sixteen is
begin
    xors <= A xor B;
end gate_level;
