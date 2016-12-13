-- == LIBRAIRIES ==

library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_ARITH.all;


-- == ENTITE ==
ENTITY Full_Add_4 IS
	
	PORT( 
			A ,B: in std_logic_vector(3 downto 0);
			Cin : in std_logic;
			Qs : out std_logic_vector(3 downto 0);
			Cout : out std_logic
			);
			
END Full_Add_4;
-- ============

-- == ARCHITECHTURE ==
ARCHITECTURE BEHV OF Full_Add_4 IS
signal carry_tempo : std_logic_vector(3 downto 0);

BEGIN
	
	-- A faire un test avec des entiers !!!!!!!!!!!!!!!!!!!!!!! 29 to 0
	
	
	
	
	-- Equations logiques ADD
	Qs(0)  <= (A(0) xor B(0) ) xor Cin;
	carry_tempo(0) <= (A(0) and B(0)) or (A(0) and Cin) or (B(0) and Cin);
		
	Qs(1) <= (A(1) xor B(1)) xor carry_tempo(0);
	carry_tempo(1) <= (A(1) and B(1)) or (A(1) and carry_tempo(0)) or (B(1) and carry_tempo(0));
	
	Qs(2) <= (A(2) xor B(2)) xor carry_tempo(1);
	carry_tempo(2) <= (A(2) and B(2)) or (A(2) and carry_tempo(1)) or (B(2) and carry_tempo(1));
	
	Qs(3) <= (A(3) xor B(3)) xor carry_tempo(2);
	carry_tempo(3) <= (A(3) and B(3)) or (A(3) and carry_tempo(2)) or (B(3) and carry_tempo(2));
	
	Cout <= carry_tempo(3);
	
END BEHV ;
-- ======================