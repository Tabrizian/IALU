library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity carry_look_ahead is
    port(
            a : in STD_LOGIC_VECTOR(3 downto 0);
            b : in STD_LOGIC_VECTOR(3 downto 0);
            command : in STD_LOGIC;
            carry_in : in STD_LOGIC;
            carry_out : out STD_LOGIC;
            res : out STD_LOGIC_VECTOR(3 downto 0)
        );
end carry_look_ahead;

architecture gate_level of carry_look_ahead is
    component pi_gi_generator_4 is
        port(
                a : in STD_LOGIC_VECTOR(3 downto 0);
                b : in STD_LOGIC_VECTOR(3 downto 0);
                command : in STD_LOGIC;
                p : out STD_LOGIC_VECTOR(3 downto 0);
                g : out STD_LOGIC_VECTOR(3 downto 0)
            );
    end component;

    component quarter_subtractor is
        port(
                a : in STD_LOGIC;
                b : in STD_LOGIC;
                bin : in STD_LOGIC;
                sub : out STD_LOGIC
            );
    end component;

    signal p,g : STD_LOGIC_VECTOR(3 downto 0);

    signal carry : STD_LOGIC_VECTOR(2 downto 0);
    signal subtract : STD_LOGIC_VECTOR(3 downto 0);
begin
    pi_gi : pi_gi_generator_4 port map(a, b, command, p, g);
    carry(0) <= g(0) or (p(0) and carry_in);
    carry(1) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and carry_in);
    carry(2) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or
                (p(2) and p(1) and p(0) and carry_in);
    carry_out <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or
                 (p(3) and p(2) and p(1) and g(0)) or
                 (p(3) and p(2) and p(1) and p(0) and carry_in);

    fs1 : quarter_subtractor port map(a(0), b(0), carry_in, subtract(0));
    fs2 : quarter_subtractor port map(a(1), b(1), carry(0), subtract(1));
    fs3 : quarter_subtractor port map(a(2), b(2), carry(1), subtract(2));
    fs4 : quarter_subtractor port map(a(3), b(3), carry(2), subtract(3));

    res(0) <= ((p(0) xor carry_in) and (not command)) or
              (subtract(0) and command);
    res(1) <= ((p(1) xor carry(0)) and (not command)) or
              (subtract(1) and command);
    res(2) <= ((p(2) xor carry(1)) and (not command)) or
              (subtract(2) and command);
    res(3) <= ((p(3) xor carry(2)) and (not command)) or
              (subtract(3) and command);

end gate_level;
