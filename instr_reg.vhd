-- == LIBRAIRIES ==
library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_ARITH.all;

-- Registre d'instruction	-- V2 pour le MI

-- == ENTITE ==
ENTITY instr_reg IS	
	PORT(	clear , clock , EnableInstr , LoadInstr: in std_logic;	-- Ajout de LoadIntsr
			E_from_M : in std_logic_vector(7 downto 0);
			to_Micro , to_bus : out std_logic_vector(3 downto 0));
END instr_reg;
-- ============

-- == ARCHITECHTURE ==
ARCHITECTURE BEHV OF instr_reg IS

BEGIN
	process(clock , clear)		-- Sensibilité sur Clock et clear
	variable mem_tempo : std_logic_vector(7 downto 0);
	begin	
			if clear = '0' then				-- ASYNCHRONE 
							if LoadInstr = '1'  then
							
										mem_tempo := E_from_M;			-- Stockage dans le regitres les data temporaire
									
							elsif LoadInstr = '0' then
			
											if clock = '1' and clock'event  then				
																if EnableInstr = '1' then						-- Separation des données
																		to_Micro(3 downto 0) <= mem_tempo(7 downto 4);
																		to_bus(3 downto 0) <= mem_tempo(3 downto 0);
																else
																		to_Micro(3 downto 0) <= "ZZZZ";
																		to_bus(3 downto 0) <= "ZZZZ";											
																end if;												
											end if;
							else
							end if;					
			else 
					to_Micro(3 downto 0) <= "ZZZZ";		-- Mise en Haute Impedance
					to_bus(3 downto 0) <= "ZZZZ";
					mem_tempo := "ZZZZZZZZ";
			end if;
	end process;
END BEHV ;
-- ======================