-- == LIBRAIRIES ==

library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_ARITH.all;
library work;
use work.packageperso.all;

-- == ENTITE ==
ENTITY Full_Soust_4 IS
	
	PORT( 
			A ,B: in std_logic_vector(3 downto 0);
			--Cin : in std_logic;
			Qs : out std_logic_vector(3 downto 0);
			Cout , Neg: out std_logic
			);
			
END Full_Soust_4;
-- ============

-- == ARCHITECHTURE ==
ARCHITECTURE BEHV OF Full_Soust_4 IS
signal carry_tempo : std_logic_vector(3 downto 0);
signal inv_B : std_logic_vector(3 downto 0);
BEGIN

	inv_B <= not B;
	
	Soust_Add : Full_Add_4 port map(A , inv_B , '1', Qs , Cout);
	process(A , B)
	begin
		if A < B then
			Neg <= '1';
		else
			Neg <= '0';
		end if;	
	end process;

END BEHV ;
-- ======================


	-- == BOURIN VERSION !!!!!!!!!!!!!!!!!!!!!!!!!!!
	--Qs(0) <= (A(0) xor B(0)) xor Cin;
	--carry_tempo(0) <= (not A(0) and B(0)) or (not A(0) and Cin) or (B(0) and Cin);
	
	--Qs(1) <= (A(1) xor B(1)) xor carry_tempo(0);
	--carry_tempo(1) <= (not A(1) and B(1)) or (not A(1) and carry_tempo(0)) or (B(1) and carry_tempo(0));
	
	--Qs(2) <= (A(2) xor B(2)) xor carry_tempo(1);
	--carry_tempo(2) <= (not A(2) and B(2)) or (not A(2) and carry_tempo(1)) or (B(2) and carry_tempo(1));
	
	--Qs(3) <= (A(3) xor B(3)) xor carry_tempo(2);
	--carry_tempo(3) <= (not A(3) and B(3)) or (not A(3) and carry_tempo(2)) or (B(3) and carry_tempo(2));
	
	--Cout <= carry_tempo(3);
	