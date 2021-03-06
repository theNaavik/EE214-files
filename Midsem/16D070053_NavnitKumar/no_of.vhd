------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library std;
use std.standard.all;

entity no_of is
	port (x: in std_logic_vector(7 downto 0);
		o,z : out std_logic_vector(3 downto 0));
end entity;
architecture  behave6 of no_of is
	component FA is
	port (a,b,cin : in std_logic;
		s,cout : out std_logic);
	end component;
	component FSA is
	port (x: in std_logic_vector(3 downto 0);
		o: out std_logic_vector(2 downto 0));
	end component;
	component FD is
	port (m,n,bin : in std_logic;
		d,bout : out std_logic);
	end component;
	signal x2,x1,w,k,k1 : std_logic_vector(3 downto 0);
	signal o2,o1 : std_logic_vector(2 downto 0); signal c,d,e :std_logic;
begin 
	x2(3) <= x(7);x2(2) <= x(6);x2(1) <= x(5);x2(0) <= x(4);
	x1(3) <= x(3);x1(2) <= x(2);x1(1) <= x(1);x1(0) <= x(0);
	FSA_0 : FSA port map(x1,o1);
	FSA_1 : FSA port map(x2,o2);
	------------------------------------------------------
	FA_0: FA port map (o1(0) ,o2(0),'0',k(0),c);
	FA_1: FA port map (o1(1) ,o2(1),c ,k(1),d);
	FA_2: FA port map (o1(2) ,o2(2),d ,k(2),e);
	o(2) <= k(2); o(1) <= k(1); o(0) <= k(0);
	o(3) <= e;
----------------------------------------------------------------
	FD_0: FD port map ('0' ,k(0) ,'0'  ,k1(0) ,w(0));
	FD_1: FD port map ('0' ,k(1) ,w(0) ,k1(1) ,w(1));
   	FD_2: FD port map ('0' ,k(2) ,w(1) ,k1(2) ,w(2)); 
	FD_3: FD port map ('1' ,e ,w(2) ,k1(3) ,w(3));
	z(3) <= k1(3); z(2) <= k1(2); z(1) <= k1(1); z(0) <= k1(0);
end behave6;
