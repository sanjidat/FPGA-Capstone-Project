

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity C4M1P1 is
	port(
		SW   : in  std_logic_vector(7 downto 0);    -- Switches S7.....S0
		HEX0 : out std_logic_vector(6 downto 0);    -- 7 seg Display HEX0
		HEX1 : out std_logic_vector(6 downto 0)     -- 7 seg Display HEX1
		);
end entity;

architecture behavior of C4M1P1 is 
	
		signal D0, D1     : std_logic_vector(3 downto 0);
		signal seg0, seg1 : std_logic_vector(6 downto 0);   -- segment (a-g)

		
begin

   -- Split the switch input into 4 bit values
	
	D0 <= SW(3 downto 0);   -- for HEX 0
	D1 <= SW(7 downto 4);   -- for HEX 1

	
	-- HEX0 Decoder
	
	process(D0)
	
	begin
	
		case D0 is
			when "0000"  => seg0 <= "1000000" ;    -- 0
			when "0001"  => seg0 <= "1111001" ;    -- 1
			when "0010"  => seg0 <= "0100100" ;    -- 2
			when "0011"  => seg0 <= "0110000" ;    -- 3
			when "0100"  => seg0 <= "0011001" ;    -- 4
			when "0101"  => seg0 <= "0010010" ;    -- 5
			when "0110"  => seg0 <= "0000010" ;    -- 6
			when "0111"  => seg0 <= "1111000" ;    -- 7
			when "1000"  => seg0 <= "0000000" ;    -- 8
			when "1001"  => seg0 <= "0010000" ;    -- 9
			when others =>  seg0 <= "1111111" ;    -- Blank (don't care)
		end case;
		
	end process;
	
   -- HEX1 Decoder
	
	process(D1)
	
	begin
	
		case D1 is
			when "0000"  => seg1 <= "1000000" ;   -- 0
			when "0001"  => seg1 <= "1111001" ;   -- 1
			when "0010"  => seg1 <= "0100100" ;   -- 2
			when "0011"  => seg1 <= "0110000" ;   -- 3
			when "0100"  => seg1 <= "0011001" ;   -- 4
			when "0101"  => seg1 <= "0010010" ;   -- 5
			when "0110"  => seg1 <= "0000010" ;   -- 6
			when "0111"  => seg1 <= "1111000" ;   -- 7
			when "1000"  => seg1 <= "0000000" ;   -- 8
			when "1001"  => seg1 <= "0010000" ;   -- 9
			when others  => seg1 <= "1111111" ;   -- Blank (don't care)
		end case;
		
	end process;			
			
			
-- Connect Outpts
	
	HEX0 <= seg0;
	HEX1 <= seg1;
	
end architecture;
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			