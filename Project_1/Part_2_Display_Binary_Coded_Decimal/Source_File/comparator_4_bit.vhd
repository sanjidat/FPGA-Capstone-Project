library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_4_bit is 
	Port(
		a : in STD_LOGIC_VECTOR(3 downto 0);
		G : out STD_LOGIC
	);

end comparator_4_bit;

architecture Structural of comparator_4_bit is
	signal G0, G1, G2, G3 : STD_LOGIC;
	--constant b : STD_LOGIC_VECTOR := "1001"; 

begin
	
	G <= (a(3) and a(2) and not(a(1))) or (a(3) and a(1));
	
end Structural;