----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sanjida Orin Tawhid
-- 
-- Create Date:    09:00:01 06/30/2025 
-- Design Name: 
-- Module Name:    BCD_Adder - Structural 
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

entity BCD_Adder is
	port (
		SW   : in  STD_LOGIC_VECTOR(8 downto 0);
		LEDR : out STD_LOGIC_VECTOR(9 downto 0);
		HEX0 : out STD_LOGic_VECTOR(6 downto 0);
		HEX1 : out STD_LOGIC_VECTOR(6 downto 0); 
	   HEX3 : out STD_LOGIC_VECTOR(6 downto 0);
		HEX5 : out STD_LOGIC_VECTOR(6 downto 0)
		);
end BCD_Adder;

architecture Structural of BCD_Adder is 
	
	component Full_Adder is 
		Port(
			a    : in STD_LOGIC;
			b    : in STD_LOGIC;
			cin  : in STD_LOGIC;
			cout : out STD_LOGIC;
			sum  : out STD_LOGIC
			);
	end component;
		
	component MUX_2_to_1 is 
	port (
		a, b : in STD_LOGIC_VECTOR(4 downto 0);
		s    : in STD_LOGIC;
		y    : out STD_LOGIC_VECTOR(4 downto 0)
		);
	end component;
	
	component circuitA is 

	Port(
		v : in STD_LOGIC_VECTOR(4 downto 0);
		a : out STD_LOGIC_VECTOR(4 downto 0)
		);
	end component;

	component comparator_5_bit is 
	Port(
		a : in STD_LOGIC_VECTOR(4 downto 0);
		G : out STD_LOGIC
	);

	end component;
	
	signal Sum , A, D0                    : STD_LOGIC_VECTOR(4 downto 0);
	signal X, Y,  D1                      : STD_LOGIC_VECTOR(3 downto 0);
	signal C1, C2, C3, Cin, Cout          : STD_LOGIC;
	signal Z, X_invalid, Y_invalid, error : STD_LOGIC;
	signal X_int, Y_int,Sum_int           : integer;
	
	constant dont_care : STD_LOGIC_VECTOR(6 downto 0) := "0111111";
	
	type seg_array is array(0 to 9) of STD_LOGIC_VECTOR(6 downto 0);
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
		X   <= SW(3 downto 0);
		Y   <= SW(7 downto 4);
		Cin <= SW(8);
		
		X_invalid <= X(3) and (X(2) or X(1));
		Y_invalid <= Y(3) and (Y(2) or Y(1));
		
		error <= X_invalid or Y_invalid;
		
		X_int <= to_integer(unsigned(X));
		Y_int <= to_integer(unsigned(Y));
	
	
-- Component Instantiate 
   
		FA1: Full_Adder port map (X(0),Y(0),Cin,C1,Sum(0));
		FA2: Full_Adder port map (X(1),Y(1),C1,C2,Sum(1));
		FA3: Full_Adder port map (X(2),Y(2),C2,C3,Sum(2));
		FA4: Full_Adder port map (X(3),Y(3),C3,Cout,Sum(3));
	
		Sum(4)  <= Cout;
		Sum_int <= to_integer(unsigned(Sum));
	
		CA  : circuitA port map (Sum, A); 
		comp: comparator_5_bit port map (Sum, Z);
		MUX : MUX_2_to_1 port map (Sum, A, Z, D0);
		
-- assign outputs
		
		LEDR(3 downto 0) <= Sum(3 downto 0) when error <= '0' else "0000";
		LEDR(4)          <= Cout when error <= '0' else '0';
		LEDR(9)          <= X_invalid or Y_invalid;
	
		D1   <= "0001" when z = '1' else "0000" ;
	
		HEX0 <= segment(to_integer(unsigned(D0)) mod 10) when error <= '0' else dont_care;
		HEX1 <= segment(to_integer(unsigned(D1)) mod 10) when error <= '0' else dont_care;
	
		HEX5 <=  segment(X_int mod 10) when X_int <= 9  else dont_care;
		HEX3 <=  segment(Y_int mod 10) when Y_int <= 9  else dont_care;
	
end Structural;
	


		