library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2_to_1 is 
	port (
		a, b : in STD_LOGIC_VECTOR(4 downto 0);
		s    : in STD_LOGIC;
		y    : out STD_LOGIC_VECTOR(4 downto 0)
	);
end MUX_2_to_1;

architecture Structural of MUX_2_to_1 is
	
begin
	
	y(0) <= (a(0) and not(s)) or (b(0) and s);
	y(1) <= (a(1) and not(s)) or (b(1) and s);
	y(2) <= (a(2) and not(s)) or (b(2) and s);
	y(3) <= (a(3) and not(s)) or (b(3) and s);
	y(4) <= (a(4) and not(s)) or (b(4) and s);

end Structural;