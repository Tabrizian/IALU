library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity half_subtractor is
    port(
            a : in STD_LOGIC;
            b : in STD_LOGIC;
            sub : out STD_LOGIC;
            bout : out STD_LOGIC
        );
end half_subtractor;

architecture gate_level of half_subtractor is
begin
    sub <= a xor b;
    bout <= (not a) and b;
end gate_level;
