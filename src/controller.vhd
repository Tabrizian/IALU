library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity controller is
    port(
            a : in STD_LOGIC_VECTOR(15 downto 0);
            b : in STD_LOGIC_VECTOR(15 downto 0);
            control : in STD_LOGIC_VECTOR(2 downto 0);
            overflow_flag : out STD_LOGIC
        );
end entity;
