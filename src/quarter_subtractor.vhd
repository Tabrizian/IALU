library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity quarter_subtractor is
    port(
            a : in STD_LOGIC;
            b : in STD_LOGIC;
            bin : in STD_LOGIC;
            sub : out STD_LOGIC
        );
end quarter_subtractor;

architecture gate_level of quarter_subtractor is
begin
    sub <= ((not a) and (not b) and bin) or ((not a) and b and (not bin)) or
           (a and (not b) and (not bin));
end gate_level;

