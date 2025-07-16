library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_5_bit is 
	Port(
		a : in STD_LOGIC_VECTOR(4 downto 0);
		G : out STD_LOGIC
	);

end comparator_5_bit;

architecture Structural of comparator_5_bit is
	signal G0, G1, G2, G3 : STD_LOGIC;

begin
	
	G <= (a(4) and not(a(3)) and not(a(2))) or (not(a(4)) and a(3) and (a(1) or a(2))) or (not(A(4)) and A(3) and not(A(2)) and not(A(1)) and A(0));
	
end Structural;