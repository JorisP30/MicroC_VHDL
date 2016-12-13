-- == LIBRAIRIES ==

library ieee;
use ieee.std_logic_1164.all;



-- == ENTITE ==
ENTITY input_reg IS
	
	PORT(	Enable_IN_reg : in std_logic;
			Data_in : in std_logic_vector(3 downto 0);
			to_bus : out std_logic_vector(3 downto 0)	
	);
END input_reg ;
-- ============




-- == ARCHITECHTURE ==
ARCHITECTURE BEHV OF input_reg IS
--SIGNAL 

BEGIN

	PROCESS(Enable_in_reg)
	variable data_tempo : std_logic_vector(3 downto 0);
	begin
			if Enable_In_reg = '1' then
			
					data_tempo := Data_In;
			
			else
					data_tempo := "ZZZZ";
			end if;
		
			to_bus <= data_tempo;
		
	end process;
	
END BEHV ;
-- ======================