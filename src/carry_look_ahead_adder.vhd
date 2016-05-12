library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity carry_look_ahead_adder is
    port(
            a : in STD_LOGIC_VECTOR(3 downto 0);
            b : in STD_LOGIC_VECTOR(3 downto 0);
            carry_in : in STD_LOGIC;
            carry_out : out STD_LOGIC;
            res : out STD_LOGIC_VECTOR(3 downto 0)
        );
end carry_look_ahead_adder;

architecture gate_level of carry_look_ahead_adder is
    component pi_gi_generator_4 is
    port(
            a : in STD_LOGIC_VECTOR(3 downto 0);
            b : in STD_LOGIC_VECTOR(3 downto 0);
            p : out STD_LOGIC_VECTOR(3 downto 0);
            g : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal p,g : STD_LOGIC_VECTOR(3 downto 0);
begin
    pi_gi : pi_gi_generator_4 port map(a, b, p, g);
end gate_level;
