library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity full_subtractor is
    port(
            a : in STD_LOGIC;
            b : in STD_LOGIC;
            bin : in STD_LOGIC;
            bout : out STD_LOGIC;
            sub : out STD_LOGIC
        );
end full_subtractor;

architecture gate_level of full_subtractor is
begin
    sub <= ((not a) and (not b) and bin) or ((not a) and b and (not bin)) or
           (a and (not b) and (not bin));
    bout <= ((not a) and b) or ((not a) and bin) or (bin and b);
end gate_level;
