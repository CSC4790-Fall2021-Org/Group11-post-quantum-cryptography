library ieee;
use ieee.std_logic_1164.all;

entity bit_adder is
	port( a, b, cin		: in STD_LOGIC;
			sum, cout		: out STD_LOGIC );
end bit_adder;

architecture a of bit_adder is
begin
	sum <= (a xor b) xor cin;
	cout <= ((a xor b) and cin) or (a and b);
end a;