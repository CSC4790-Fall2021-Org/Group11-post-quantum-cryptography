LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY top_lv_components IS
GENERIC (N:INTEGER:=256);
PORT (  A_in	: in STD_LOGIC_VECTOR(8*N-1 downto 0);
	B_in	: in STD_LOGIC;
	C_in	: in STD_LOGIC_VECTOR(7 downto 0);
	ctrl_a	: in STD_LOGIC_VECTOR(7 downto 0);
	ctrl_im	: in STD_LOGIC;
	out	: out STD_LOGIC_VECTOR(7 downto 0)
);
END top_lv_components;

ARCHITECTURE main of top_lv_components IS

SIGNAL mux_to_mul, mul_to_imux, imux_to_comb, comb_to_add : STD_LOGIC_VECTOR(7 downto 0);

COMPONENT 8b	     	PORT( 	clk, clr, en, cir_shift : in STD_LOGIC;
			   	d 	: in STD_LOGIC_VECTOR(7 downto 0);
			   	q 	: out STD_LOGIC_VECTOR(7 downto 0)
		     );
END COMPONENT;
COMPONENT 256_mux	PORT( 	m_in	: in STD_LOGIC_VECTOR(8*N-1 downto 0);
			   	m_sel	: in STD_LOGIC_VECTOR(7 downto 0);
			   	m_out	: out STD_LOGIC_VECTOR(7 downto 0)
		     );
END COMPONENT;
COMPONENT multiplier	PORT(	a_mul	: in STD_LOGIC_VECTOR(7 downto 0);
			   	b_mul	: in STD_LOGIC;
			   	s_mul	: out STD_LOGIC_VECTOR(7 downto 0)
		     );		
END COMPONENT;
COMPONENT combined	PORT(	cin	: in STD_LOGIC;
		   	   	A	: in STD_LOGIC_VECTOR(7 downto 0);
      			   	B	: in STD_LOGIC_VECTOR(7 downto 0);
     			   	sum	: out STD_LOGIC_VECTOR(7 downto 0);
     			   	d	: in STD_LOGIC_VECTOR(7 downto 0);
         	 	   	e	: out STD_LOGIC_VECTOR(7 downto 0)
   	   	     );
END COMPONENT;
COMPONENT muxinverter	PORT( 	a_im	: in STD_LOGIC_VECTOR(7 downto 0);
				sel_im	: in STD_LOGIC;
			   	s_im	: out STD_LOGIC_VECTOR(7 downto 0)
		     );
END COMPONENT;
COMPONENT adder8bit	PORT( 	cin	: in STD_LOGIC;
			   	a1	: in STD_LOGIC_VECTOR(7 downto 0);
			   	b1	: in STD_LOGIC_VECTOR(7 downto 0);
			  	sum1	: out STD_LOGIC_VECTOR(7 downto 0)
		     );
END COMPONENT;

BEGIN

U1 : 256_mux	PORT MAP(m_in 	=> A_in,
			 m_sel 	=> ctrl,
			 m_out	=> mux_to_mul);

U2 : multiplier PORT MAP(a_mul 	=> mux_to_mul,
			 b_mul	=> B_in,
			 s_mul	=> mul_to_imux);

U3 : inv_mux 	PORT MAP(a_im	=> mul_to_imux,
			 sel_im => ctrl_im,
			 s_im	=> imux_to_comb);

U4 : combined	PORT MAP(??????);

U5 : adder8bit	PORT MAP(cin	=> ??????,
			 a1	=> comb_to_add,
			 b1	=> C_in,
			 sum1	=> out);

END main;