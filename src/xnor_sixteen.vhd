library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity xnor_sixteen is
    port(A : in STD_LOGIC_VECTOR(15 downto 0);
         B : in STD_LOGIC_VECTOR(15 downto 0);
    xnors :out STD_LOGIC_VECTOR(15 downto 0)
);
end xnor_sixteen;

architecture gate_level of xnor_sixteen is
begin
    xnors <= A xnor B;
end gate_level;
