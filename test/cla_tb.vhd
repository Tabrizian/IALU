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
                command : in STD_LOGIC;
                carry_in : in STD_LOGIC;
                carry_out : out STD_LOGIC;
                res : out STD_LOGIC_VECTOR(7 downto 0)
            );
    end component;
    signal a, b, res : STD_LOGIC_VECTOR(7 downto 0);
    signal command, carry_in, carry_out : STD_LOGIC;

begin
    a <= "00001111";
    b <= "00001100";
    command <= '1', '0' after 1 ns;
    carry_in <= '0';
    mapping : cla port map(a, b, command, carry_in, carry_out, res);
end test_bench;
