----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sanjida Orin Tawhid
-- 
-- Create Date:    08:00:36 06/20/2025 
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


entity C4M1P2 is
	Port(
		SW   : in  STD_LOGIC_VECTOR(3 downto 0);
		HEX0 : out STD_LOGIC_VECTOR(6 downto 0);
		HEX1 : out STD_LOGIC_VECTOR(6 downto 0)
	);

end C4M1P2;

architecture Structural of C4M1P2 is

-- Components

	component comparator_4_bit is
	Port(
		a : in STD_LOGIC_VECTOR(3 downto 0);
		G : out STD_LOGIC
	);
	end component;
	
	component MUX_2_to_1 is 
	port (
		a, b : in STD_LOGIC_VECTOR(3 downto 0);
		s    : in STD_LOGIC;
		y    : out STD_LOGIC_VECTOR(3 downto 0)
	);
	end component;
	
	component circuitA is 
	Port(
		v : in  STD_LOGIC_VECTOR(3 downto 0);
		a : out STD_LOGIC_VECTOR(3 downto 0)
	);
	end component;
	
-- Signals

	signal V, A, d0, d1 : STD_LOGIC_VECTOR(3 downto 0);
	signal Z            : STD_LOGIC;
	
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
	
begin 

	V <= SW;
	
-- Instantiate Comparator 
	i1: comparator_4_bit port map (V,Z);
	
-- Instantiate CircuitA
	i2: circuitA port map (V,A);

-- Instantiate MUX_2_to_1
	i3: MUX_2_to_1 port map (a => V, b => A, s => Z, y => d0);
	
	d1 <= "0001" when Z = '1'  else "0000";

-- Assign 7 Segment Outputs
HEX0 <= segment(to_integer(unsigned(d0)) mod 10);
HEX1 <= segment(to_integer(unsigned(d1)) mod 10);

end Structural;
	
