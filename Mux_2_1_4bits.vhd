-- == LIBRAIRIES ==

library ieee;
use ieee.std_logic_1164.all;

-- == ENTITE ==
ENTITY Mux_2_1_4bits IS				-- Special Pour sortie FULL ADD
	
	PORT( 
			A ,B : in std_logic_vector(3 downto 0);
			Sel , CA , CB , enable: in std_logic;
			S : out std_logic_vector(3 downto 0);
			S_c : out std_logic			
			);
			
END Mux_2_1_4bits;
-- ============

-- == ARCHITECHTURE ==
ARCHITECTURE BEHV OF Mux_2_1_4bits IS

BEGIN
		process(Sel , enable)
		begin
				if enable = '1' then
							if sel = '1' then		-- Par rapport au projet : 0 => Soust //  1 => ADD
								S <= A;
								S_c <= CA;
							elsif sel = '0' then
								S <= B;
								S_c <= CB;
							end if;	
				else -- enable = 0
							S <= "ZZZZ";
							S_c <= 'Z';
				end if;
		end process;
END BEHV ;
-- ======================