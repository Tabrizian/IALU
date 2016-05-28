library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity controller is
    port(
            a : in STD_LOGIC_VECTOR(7 downto 0);
            b : in STD_LOGIC_VECTOR(7 downto 0);
            control : in STD_LOGIC_VECTOR(2 downto 0);
            overflow_flag : out STD_LOGIC;
            zero_flag : out STD_LOGIC;
            sign_flag : out STD_LOGIC;
            res : out STD_LOGIC_VECTOR(7 downto 0)
        );
end entity;

architecture gate_level of controller is
    component or_eight is
        port(
                A : in STD_LOGIC_VECTOR(7 downto 0);
                B : in STD_LOGIC_VECTOR(7 downto 0);
                ors :out STD_LOGIC_VECTOR(7 downto 0)
            );
    end component;

    component and_eight is
        port(
                A : in STD_LOGIC_VECTOR(7 downto 0);
                B : in STD_LOGIC_VECTOR(7 downto 0);
                ands :out STD_LOGIC_VECTOR(7 downto 0)
            );
    end component;

    component sar_eight is
        port(
                input : in STD_LOGIC_VECTOR(7 downto 0);
                output : out STD_LOGIC_VECTOR(7 downto 0)
            );
    end component;

    component slr_eight is
        port(
                input : in STD_LOGIC_VECTOR(7 downto 0);
                output : out STD_LOGIC_VECTOR(7 downto 0)
            );
    end component;


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

    component divider_eight is
        port(
                a : in STD_LOGIC_VECTOR(7 downto 0);
                b : in STD_LOGIC_VECTOR(7 downto 0);
                res : out STD_LOGIC_VECTOR(7 downto 0);
                ovf : out STD_LOGIC
            );

    end component;

    component array_multiplier is
        port(a : in STD_LOGIC_VECTOR(3 downto 0);
             b : in STD_LOGIC_VECTOR(3 downto 0);
             ans : out STD_LOGIC_VECTOR(7 downto 0)
         );
    end component;


    signal ors, ands, multplies, dividers, clas, sals, sars :
        STD_LOGIC_VECTOR(7 downto 0);
    signal div_ovf : STD_LOGIC;
begin
    or_er : or_eight port map(a, b, ors);
    and_er : and_eight port map(a, b, ands);
    divid_er : divider_eight port map(a, b, dividers, div_ovf);
    multpli_er : array_multiplier port map(a(7 downto 4), b(7 downto 4),
        multplies);
end gate_level;
