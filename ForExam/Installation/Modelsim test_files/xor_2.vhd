library IEEE;
use IEEE.std_logic_1164.all;

entity xor_2 is
port (A:in std_logic;
	B: in std_logic;
	C : out std_logic);
	end entity;
architecture beh of xor_2 is
signal notA, notB, notAB, AnotB:std_logic;
begin
	notA <= not A;
	notB <= not B;
	notAB <= notA and B;
	AnotB <= A and notB;
	C <= notAB or AnotB;
end beh;