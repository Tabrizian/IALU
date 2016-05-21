library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sar_eight is
    port(
            input : in STD_LOGIC_VECTOR(7 downto 0);
            output : out STD_LOGIC_VECTOR(7 downto 0)
        );
end sar_eight;

architecture gate_level of sar_eight is
begin
    output(6 downto 0) <= input(7) & input(7 downto 1);
end gate_level;
