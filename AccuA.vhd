-- == LIBRAIRIES ==

library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_ARITH.all;

-- Accumulateur

-- == ENTITE ==
ENTITY AccuA IS
	
	PORT(clock ,  EnableA  , load: in std_logic;
			to_bus : inout std_logic_vector(3 downto 0);
			to_alu  : out std_logic_vector(3 downto 0));
END AccuA;
-- ============

-- == ARCHITECHTURE ==
ARCHITECTURE BEHV OF AccuA IS

BEGIN
	process(clock)
	variable data_tempo : std_logic_vector(3 downto 0);
	begin						
				if rising_edge(clock) then		-- Sur front montant 								
						if EnableA = '1' then
						
										if load = '1' then
												data_tempo := to_bus;	
										else															
												to_bus <= data_tempo;
										
										end if;
										to_alu <= data_tempo;
										
						else 			-- EnableA = '0'
										to_bus <= "ZZZZ";									
						end if;																
				end if;					
	end process;	
END BEHV ;
-- ======================