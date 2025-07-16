library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity circuitA is 

	Port(
		v : in STD_LOGIC_VECTOR(4 downto 0);
		a : out STD_LOGIC_VECTOR(4 downto 0)
	);

end circuitA;
	
architecture Structural of circuitA is

begin

	a <= std_logic_vector(unsigned(v) - 10);
	
end Structural;