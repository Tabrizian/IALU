library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity or_eight is
    port(A : in STD_LOGIC_VECTOR(7 downto 0);
         B : in STD_LOGIC_VECTOR(7 downto 0);
    ors :out STD_LOGIC_VECTOR(7 downto 0)
);
end entity;

architecture gate_level of or_eight is
begin
    ors <= A or B;
end gate_level;
