library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pi_gi_generator_8 is
    port(
            a : in STD_LOGIC_VECTOR(7 downto 0);
            b : in STD_LOGIC_VECTOR(7 downto 0);
            p : out STD_LOGIC_VECTOR(7 downto 0);
            g : out STD_LOGIC_VECTOR(7 downto 0)
        );
end pi_gi_generator_8;

architecture gate_level of pi_gi_generator_8 is
    component pi_gi_generator is
        port(
                a : in STD_LOGIC;
                b : in STD_LOGIC;
                p : out STD_LOGIC;
                g : out STD_LOGIC
            );
    end component;
begin
    GENEREATE_PI_GI:
    for i in 0 to 7 generate
        pi_gi : pi_gi_generator port map(a(i), b(i), p(i), g(i));
    end generate GENEREATE_PI_GI;
end gate_level;
