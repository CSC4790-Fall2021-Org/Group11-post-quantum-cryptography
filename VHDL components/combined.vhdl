LIBRARY ieee;               
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;


--- copy of 8 bit adder

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




--- copy of register

LIBRARY ieee;   

entity reg_aclr_en_1bit is
port (clk:  in std_logic;
      clr, en:  in std_logic;
      d: in std_logic_vector(7 downto 0);
      e: out std_logic_vector(7 downto 0)
		);
end entity;

architecture arch of reg_aclr_en_1bit is 

begin
     process(clk, clr, en)
	  begin
             	if (clr='1') then
                 	e<='0';
		else
			
	    			if (clk'event and clk='1' and en='1' ) then             
		  			e<= d;		 
             			end if;
	  end if;
	  end process;
end arch;


--- combined

LIBRARY ieee;   

entity combined is
	port(
		   cin: in std_logic;
		   A: in std_logic_vector(7 downto 0);
      	B :  in std_logic_vector(7 downto 0);
     		sum :  out std_logic_vector(7 downto 0);
     		d: in std_logic_vector(7 downto 0);
         e: out std_logic_vector(7 downto 0)
   	   );
end entity;

architecture arch of combined is

component adder8bit is 
	port
	(
		cin :  in std_logic;
		A :  in std_logic_vector(7 downto 0);
		B :  in std_logic_vector(7 downto 0);
		sum :  out std_logic_vector(7 downto 0)
	);
end component;

component reg_aclr_en_8bit is
	port (clk:  in std_logic;
    		clr, en:  in std_logic;
     		d: in std_logic_vector(7 downto 0);
    		e: out std_logic_vector(7 downto 0)
	   );
end component;

signal C1, C2: std_logic_vector(7 downto 0);

begin

sum<=C2;

x1: adder8bit
port map(cin, A, C2, C1)

x2: reg_aclr_en_8bit
port map(clk, clr, en, d=>C1, C2)

end arch;