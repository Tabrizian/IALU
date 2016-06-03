library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity slr_eight is
    port(
            input : in STD_LOGIC_VECTOR(7 downto 0);
            output : out STD_LOGIC_VECTOR(7 downto 0)
        );
end slr_eight;

architecture gate_level of slr_eight is
begin
    output(7 downto 0) <= input(6 downto 0) & '0';
end gate_level;
