library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circuitA is 

	Port(
		v : in STD_LOGIC_VECTOR(3 downto 0);
		a : out STD_LOGIC_VECTOR(3 downto 0)
	);

end circuitA;
	
architecture Structural of circuitA is

begin

	a(0) <= v(3) and v(0) and (v(1) or v(2));
	a(1) <= v(3) and v(2) and not(v(1));
	a(2) <= v(3) and v(2) and v(1);
	a(3) <= '0';
	
end Structural;