library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity select_subtractor is
    port(
            a : in STD_LOGIC_VECTOR(7 downto 0);
            b : in STD_LOGIC_VECTOR(7 downto 0);
            res : out STD_LOGIC_VECTOR(7 downto 0);
            bout : out STD_LOGIC
        );
end select_subtractor;

architecture gate_level of select_subtractor is
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
    signal subtract : STD_LOGIC_VECTOR(7 downto 0);
    signal carry_out : STD_LOGIC;
begin
    cla_inst : cla port map( a, b, '1', '0', carry_out, subtract);
    res <= a when carry_out = '1' else
           subtract when carry_out = '1';
    bout <= carry_out;
end gate_level;
