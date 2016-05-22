library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity carry_look_ahead_adder_tb is

    end entity;

architecture test_bench of carry_look_ahead_adder_tb is
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
    signal a, b, res : STD_LOGIC_VECTOR(3 downto 0);
    signal carry_in, carry_out : STD_LOGIC;
    signal command : STD_LOGIC;
begin
    mapping : carry_look_ahead_adder port map(a, b, command,
    carry_in, carry_out, res);

    command <= '0', '1' after 1 ns;
    carry_in <= '0';
    a <= "0010";
    b <= "0001";
end test_bench;
