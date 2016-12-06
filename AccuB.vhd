-- == LIBRAIRIES ==

library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_ARITH.all;



-- Registre d'instruction


-- == ENTITE ==
ENTITY AccuB IS
	
	PORT(clock , reset ,  EnableB  , load: in std_logic; -- reset ?
			to_bus : inout std_logic_vector(3 downto 0);
			to_alu  : out std_logic_vector(3 downto 0)
			);
END AccuB;
-- ============

-- == ARCHITECHTURE ==
ARCHITECTURE BEHV OF AccuB IS


BEGIN
	process(clock)
	
	variable data_tempo : std_logic_vector(3 downto 0);
	begin
						
						if rising_edge(clock) then
										
									if EnableB = '1' then
									
													if load = '1' then
															data_tempo := to_bus;	
													else															
															to_bus <= data_tempo;
													
													end if;
													to_alu <= data_tempo;
													
									else 			-- EnableB = '0'
													to_bus <= "ZZZZ";									
									end if;
																	
						end if;	
				
	end process;
END BEHV ;
-- ======================