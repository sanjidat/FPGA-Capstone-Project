library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is 
	Port(
		a    : in STD_LOGIC;
		b    : in STD_LOGIC;
		cin  : in STD_LOGIC;
		cout : out STD_LOGIC;
		sum  : out STD_LOGIC
	);
	
end Full_Adder;

architecture Structural of Full_Adder is 
	
	signal e : STD_LOGIC; 
	
begin 

	e    <= a xor b;
	sum  <= e xor cin;
	cout <= (b and not(e)) or (cin and e);
	
end architecture;