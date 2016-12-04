-- == LIBRAIRIES ==

library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_ARITH.all;
library work;
use work.packageperso.all;


-- Registre d'instruction


-- == ENTITE ==
ENTITY ALU IS
	
	PORT( Add_sub , Enable_ALU : in std_logic; -- 0 => - 1 // => +
			from_accuA , from_accuB : in std_logic_vector(3 downto 0);
			Carry , Neg , Zero: out std_logic;
			Alu_to_bus  : out std_logic_vector(3 downto 0) 
			);
END ALU;
-- ============

-- == ARCHITECHTURE ==
ARCHITECTURE BEHV OF ALU IS
signal result_tempo : std_logic_vector(3 downto 0);
signal S_Add , S_Soust : std_logic_vector(3 downto 0);
signal S_CAdd , S_CSoust : std_logic;
BEGIN

	Add_4 : Full_Add_4 port map(from_accuA , from_accuB , '0' , S_Add, S_CAdd);
	Sous_4 : Full_Soust_4 port map(from_accuA , from_accuB , S_Soust , S_CSoust , Neg);
	Mux_1 : Mux_2_1_4bits port map(S_Add , S_Soust ,Add_sub , S_CAdd , S_CSoust , Enable_ALU , result_tempo , Carry);
	process(Add_sub)	
	begin				-- PREVOIR HZ POUR LE BUS DE DATA !!!!!!!!!!!!!!!!!!!!!!!!!
			
						if result_tempo = "0000" then
								Zero <= '1';
						else
								Zero <= '0';
						end if;
						
						Alu_to_bus <= result_tempo;			
	end process;
END BEHV ;
-- ======================