library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cla_adder is
    port(
            a : in STD_LOGIC_VECTOR(7 downto 0);
            b : in STD_LOGIC_VECTOR(7 downto 0);
            command : in STD_LOGIC;
            carry_in : in STD_LOGIC;
            carry_out : out STD_LOGIC;
            res : out STD_LOGIC_VECTOR(7 downto 0)
        );
end entity;

architecture gate_level of cla_adder is
    component carry_look_ahead_adder is
        port(
                a : in STD_LOGIC_VECTOR(3 downto 0);
                b : in STD_LOGIC_VECTOR(3 downto 0);
                command : in STD_LOGIC;
                carry_in : in STD_LOGIC;
                carry_out : out STD_LOGIC;
                res : out STD_LOGIC_VECTOR(3 downto 0)
            );

    end component;
    signal mid_cout : STD_LOGIC;
begin
    cla1 : carry_look_ahead_adder port map(a(3 downto 0), b(3 downto 0),
     command, carry_in, mid_cout, res(3 downto 0));
    cla2 : carry_look_ahead_adder port map(a(7 downto 4), b(7 downto 4),
     command, mid_cout, carry_out, res(7 downto 4));
end gate_level;

