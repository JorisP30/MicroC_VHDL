-- == LIBRAIRIES ==

library ieee;
Use ieee.numeric_std.all ;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_ARITH.all;

-- == ENTITE ==
ENTITY gene_phase IS
	
	PORT(	clock , reset : in std_logic;
			Phases : out std_logic_vector(3 downto 0)
			);
END gene_phase;
-- ============

-- == ARCHITECHTURE ==
ARCHITECTURE BEHV OF gene_phase IS
BEGIN
process(clock , reset)
variable num_phases : std_logic_vector(1 downto 0) := "00"; --integer range 3 to 0  ;
--variable visu_phases : std_logic_vector(3 downto 0);
begin
		if reset = '0' then
					num_phases := "00";
					Phases <= "0000";
		elsif reset = '1' then
					if falling_edge(clock) then					
											
								
									if num_phases = 0 then
										phases <= "0001";
									elsif	num_phases = 1 then
										phases <= "0010";
									elsif num_phases = 2 then
										phases <= "0100";
									elsif num_phases = 3 then
										phases <= "1000";
									else
										phases <= "0000";
									end if;	
									num_phases := num_phases + 1;	
					end if;	
		else			
		end if;	
			
end process;
		
END BEHV ;
-- ======================