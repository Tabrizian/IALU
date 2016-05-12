library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity carray_look_ahead_adder is
    port(
            a : in STD_LOGIC_VECTOR(7 downto 0);
            b : in STD_LOGIC_VECTOR(7 downto 0);
            carry_in : in STD_LOGIC;
            carry_out : out STD_LOGIC;
            res : out STD_LOGIC_VECTOR(7 downto 0)
        );
end carray_look_ahead_adder;
