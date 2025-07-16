----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sanjida Orin Tawhid
-- 
-- Create Date:    17:21:13 06/06/2025 
-- Design Name: 
-- Module Name:    comparator_4bit - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity C4M1P1 is
	port(
		SW   : in  std_logic_vector(7 downto 0);    -- Switches S7.....S0
		HEX0 : out std_logic_vector(6 downto 0);    -- 7 seg Display HEX0
		HEX1 : out std_logic_vector(6 downto 0)     -- 7 seg Display HEX1
		);
end entity;

architecture Structural of C4M1P1 is 
	
		signal D0, D1         : std_logic_vector(3 downto 0);
		signal D0_int, D1_int : integer;
		type seg_array is array (0 to 9) of STD_LOGIC_VECTOR(6 downto 0);
		constant segment : seg_array := (
		  "1000000", -- 0
        "1111001", -- 1
        "0100100", -- 2
        "0110000", -- 3
        "0011001", -- 4
        "0010010", -- 5
        "0000010", -- 6
        "1111000", -- 7
        "0000000", -- 8
        "0010000"  -- 9
			
			);
			
		constant dont_care : STD_LOGIC_VECTOR(6 downto 0) := "1111110";   -- display '-'
		
begin

   -- Split the switch input into 4 bit values
	
	D0 <= SW(3 downto 0);   -- for HEX 0
	D1 <= SW(7 downto 4);   -- for HEX 1
			
	D0_int <= to_integer(unsigned(D0));	
	D1_int <= to_integer(unsigned(D1));	
	
-- Connect Outpts
	
	HEX0 <= segment(D0_int) when D0_int <= 9 else dont_care;
	HEX1 <= segment(D1_int) when D1_int <= 9 else dont_care;
	
end Structural;
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			