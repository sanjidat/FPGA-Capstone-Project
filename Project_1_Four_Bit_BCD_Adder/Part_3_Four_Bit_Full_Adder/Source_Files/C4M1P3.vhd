library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity C4M1P3 is
	Port(
		SW : in STD_LOGIC_VECTOR(8 downto 0);
		LEDR : out STD_LOGIC_VECTOR(4 downto 0)
	);
end C4M1P3;
	
architecture Structural of C4M1P3 is 

	-- component Declaration
	component Full_Adder is 
	Port(
		a    : in STD_LOGIC;
		b    : in STD_LOGIC;
		cin  : in STD_LOGIC;
		cout : out STD_LOGIC;
		sum  : out STD_LOGIC
	);
	end component;

-- signal Declaration
	signal A, B, Sum : STD_LOGIC_VECTOR(3 downto 0);
	signal C1,C2,c3, Cin, Cout : STD_LOGIC;
		
begin

	A   <= SW(3 downto 0);
	B   <= SW(7 downto 4);
	Cin <= SW(8);
	
-- component instantiate 
	i1: Full_Adder port map (A(0),B(0),Cin,C1,Sum(0));
	i2: Full_Adder port map (A(1),B(1),C1,C2,Sum(1));
	i3: Full_Adder port map (A(2),B(2),C2,C3,Sum(2));
	i4: Full_Adder port map (A(3),B(3),C3,Cout,Sum(3));

-- assign LED
	LEDR(3 downto 0) <= Sum(3 downto 0);
	LEDR(4) 			 <= Cout;

end Structural;
	
	
	
	