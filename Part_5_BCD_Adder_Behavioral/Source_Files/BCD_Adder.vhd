----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sanjida Orin Tawhid
-- 
-- Create Date:    08:00:36 07/05/2025 
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

entity BCD_Adder is 
	port(
		SW   :  in STD_LOGIC_VECTOR(8 downto 0);
		LEDR : out STD_LOGIC_VECTOR(9 downto 0);
		HEX0 : out STD_LOGIC_VECTOR(6 downto 0);
		HEX1 : out STD_LOGIC_VECTOR(6 downto 0);
		HEX3 : out STD_LOGIC_VECTOR(6 downto 0);
		HEX5 : out STD_LOGIC_VECTOR(6 downto 0)
		);
end BCD_Adder;

architecture Behavioral of BCD_Adder is 

	component Full_Adder is 
	Port(
		a    : in STD_LOGIC;
		b    : in STD_LOGIC;
		cin  : in STD_LOGIC;
		cout : out STD_LOGIC;
		sum  : out STD_LOGIC
	);
	end component;
	
	signal A, B, Z, D0, D1 : STD_LOGIC_VECTOR(3 downto 0);
	signal Cin, C1, C2, C3, Cout : STD_LOGIC;
	signal Sum : STD_LOGIC_VECTOR(4 downto 0);
	signal A_Invalid, B_Invalid, error : STD_LOGIC;
	signal A_int, B_int : integer;
	
	constant dont_care : STD_LOGIC_Vector(6 downto 0) := "0111111";
	
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
		A <= SW(3 downto 0);
		B <= SW(7 downto 4);
		Cin <= SW(8);
		
		u1: Full_Adder port map (A(0),B(0),Cin,C1,Sum(0));
		u2: Full_Adder port map (A(1),B(1),C1,C2,Sum(1));
		u3: Full_Adder port map (A(2),B(2),C2,C3,Sum(2));
		u4: Full_Adder port map (A(3),B(3),C3,Cout,Sum(3));
		
		Sum(4) <= Cout;
		
	process(SUM)
		begin
		A_int   <= to_integer(unsigned(A));
		B_int   <= to_integer(unsigned(B));
		
		if (A_int > 9) then
			A_Invalid <= '1';
		else
			A_Invalid <= '0';
		end if;
			
		if (B_int > 9) then
			B_Invalid <= '1';
		else
			B_Invalid <= '0';
		end if;
		
		
		if (unsigned(Sum) > 9 ) then 
			D1 <= "0001";
			D0 <= STD_LOGIC_VECTOR(unsigned(Sum(3 downto 0)) - to_unsigned(10,4)) ;
		else
			D1 <= "0000";
			D0 <= Sum(3 downto 0);
		end if;
		
	end process;
		
		error <= A_Invalid or B_Invalid;
		
		LEDR(4 downto 0) <= Sum when (error <= '0')  else "00000";
		LEDR(9)          <= error;
		
		
		HEX0 <= segment(to_integer(unsigned(D0))) when (error <= '0' and unsigned(D0) < 10) else dont_care;
		HEX1 <= segment(to_integer(unsigned(D1))) when (error <= '0' and unsigned(D0) < 10) else dont_care;
		
		
		HEX5 <= segment(A_int) when (A_int >= 0 and A_int < 10) else dont_care;
		HEX3 <= segment(B_int) when (B_int >= 0 and B_int < 10) else dont_care;
		
end Behavioral;

