-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"
-- CREATED		"Tue Aug 31 19:46:09 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY adder8bit IS 
	PORT
	(
		cin :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		sum :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END adder8bit;

ARCHITECTURE bdf_type OF adder8bit IS 

COMPONENT bit_adder
	PORT(a : IN STD_LOGIC;
		 b : IN STD_LOGIC;
		 cin : IN STD_LOGIC;
		 sum : OUT STD_LOGIC;
		 cout : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	sum_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
signal cout: std_logic;


BEGIN 



b2v_add0 : bit_adder
PORT MAP(a => A(0),
		 b => B(0),
		 cin => cin,
		 sum => sum_ALTERA_SYNTHESIZED(0),
		 cout => SYNTHESIZED_WIRE_0);


b2v_add1 : bit_adder
PORT MAP(a => A(1),
		 b => B(1),
		 cin => SYNTHESIZED_WIRE_0,
		 sum => sum_ALTERA_SYNTHESIZED(1),
		 cout => SYNTHESIZED_WIRE_1);


b2v_add2 : bit_adder
PORT MAP(a => A(2),
		 b => B(2),
		 cin => SYNTHESIZED_WIRE_1,
		 sum => sum_ALTERA_SYNTHESIZED(2),
		 cout => SYNTHESIZED_WIRE_2);


b2v_add3 : bit_adder
PORT MAP(a => A(3),
		 b => B(3),
		 cin => SYNTHESIZED_WIRE_2,
		 sum => sum_ALTERA_SYNTHESIZED(3),
		 cout => SYNTHESIZED_WIRE_3);


b2v_add4 : bit_adder
PORT MAP(a => A(4),
		 b => B(4),
		 cin => SYNTHESIZED_WIRE_3,
		 sum => sum_ALTERA_SYNTHESIZED(4),
		 cout => SYNTHESIZED_WIRE_4);


b2v_add5 : bit_adder
PORT MAP(a => A(5),
		 b => B(5),
		 cin => SYNTHESIZED_WIRE_4,
		 sum => sum_ALTERA_SYNTHESIZED(5),
		 cout => SYNTHESIZED_WIRE_5);


b2v_add6 : bit_adder
PORT MAP(a => A(6),
		 b => B(6),
		 cin => SYNTHESIZED_WIRE_5,
		 sum => sum_ALTERA_SYNTHESIZED(6),
		 cout => SYNTHESIZED_WIRE_6);


b2v_add7 : bit_adder
PORT MAP(a => A(7),
		 b => B(7),
		 cin => SYNTHESIZED_WIRE_6,
		 sum => sum_ALTERA_SYNTHESIZED(7),
                 cout=>cout);

sum <= sum_ALTERA_SYNTHESIZED;

END bdf_type;