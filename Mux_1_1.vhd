-- == LIBRAIRIES ==

library ieee;
use ieee.std_logic_1164.all;



-- == ENTITE ==
ENTITY Mux_1_1 IS			-- Mux speciale etre la RAM et le RI
	
	PORT( ReadMem : in std_logic;
			data_mem : in std_logic_vector(7 downto 0);
			out_data_mem : out std_logic_vector(7 downto 0)	
		 );
END Mux_1_1 ;
-- ============

-- == ARCHITECHTURE ==
ARCHITECTURE BEHV OF Mux_1_1 IS

BEGIN	
	PROCESS(ReadMem)
	begin
				if ReadMem = '1' then
						out_data_mem <= data_mem;
				else		-- ReadMem = '0'
						out_data_mem <= "ZZZZZZZZ";
				end if;
	end process;
	
END BEHV ;
-- ======================