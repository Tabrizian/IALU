library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pi_gi_generator is
    port(
            a : in STD_LOGIC;
            b : in STD_LOGIC;
            command : in STD_LOGIC;
            p : out STD_LOGIC;
            g : out STD_LOGIC
        );
end entity;

architecture gate_level of pi_gi_generator is
begin
    p <= ((a xor b) and (not command)) or (((not a) or b) and (command));
    g <= (a and b and (not command)) or ((not a) and b and command);
end gate_level;
