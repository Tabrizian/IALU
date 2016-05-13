library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cla_tb is
    end entity;

architecture test_bench of cla_tb is
    component cla is
        port(
                a : in STD_LOGIC_VECTOR(7 downto 0);
                b : in STD_LOGIC_VECTOR(7 downto 0);
                carry_in : in STD_LOGIC;
                carry_out : out STD_LOGIC;
                res : out STD_LOGIC_VECTOR(7 downto 0)
            );
    end component;

    signal a, b, res : STD_LOGIC_VECTOR(7 downto 0);
    signal carry_in, carry_out : STD_LOGIC;
begin
    mapping : cla port map(a, b, carry_in, carry_out, res);

    a <= "00000101";
    b <= "00000101";
    carry_in <= '0';
end test_bench;
