-- == LIBRAIRIES ==

library ieee;
use ieee.std_logic_1164.all;



-- == ENTITE ==
ENTITY output_reg IS
	
	PORT(	Enable_Out_Reg : in std_logic;
			from_bus : in std_logic_vector(3 downto 0);
			to_port : out std_logic_vector(3 downto 0)	
	);
END output_reg ;
-- ============




-- == ARCHITECHTURE ==
ARCHITECTURE BEHV OF output_reg IS
--SIGNAL 

BEGIN
	
	PROCESS(Enable_Out_Reg)
	variable data_tempo : std_logic_vector(3 downto 0);
	begin
		
		if Enable_Out_Reg = '1' then
				data_tempo := from_bus;
		else
			data_tempo := "ZZZZ";
		end if;
			
		to_port <= data_tempo;
		
	end process;
	
END BEHV ;
-- ======================