-- == LIBRAIRIES ==

library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_ARITH.all;

-- PROGRAMM COUNTER du µP
-- Compte de 0000 à 1111

-- == ENTITE ==
ENTITY prog_count IS
	
	PORT(clock , clear : in std_logic;
				cmd_mem : out std_logic_vector(3 downto 0));
END prog_count;
-- ============

-- == ARCHITECHTURE ==
ARCHITECTURE BEHV OF prog_count IS

BEGIN	
	process(clock , clear)
		variable compteur : std_logic_vector(3 downto 0);			-- Variable compteur
		begin
		
			if clear = '0' then
						if rising_edge(clock) then										
										compteur := compteur + 1;															
								end if;		
			else
					compteur := "0000" ;		-- RAZ du compteur	
					
			end if;
			cmd_mem <= compteur;
			
	end process;
END BEHV ;
-- ======================