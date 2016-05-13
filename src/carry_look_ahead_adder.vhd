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

    signal carry : STD_LOGIC_VECTOR(2 downto 0);
begin
    pi_gi : pi_gi_generator_4 port map(a, b, p, g);
    carry(0) <= g(0) or (p(0) and carry_in);
    carry(1) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and carry_in);
    carry(2) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or
                (p(2) and p(1) and p(0) and carry_in);
    carry_out <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or
                (p(3) and p(2) and p(1) and g(0)) or
                (p(3) and p(2) and p(1) and p(0) and carry_in);

    res(0) <= p(0) xor carry_in;
    res(1) <= p(1) xor carry(0);
    res(2) <= p(2) xor carry(1);
    res(3) <= p(3) xor carry(2);

end gate_level;
