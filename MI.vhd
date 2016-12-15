-- == LIBRAIRIES ==

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.packageperso.all;

-- MICRO INSTRUCTION MI = BOSS

-- == ENTITE ==
ENTITY MI IS
	
	PORT(	phases , data_RI : in std_logic_vector(3 downto 0);
			clock : in std_logic;
			Enables : out std_logic_vector(10 downto 0)
			);
END MI;
-- ============

-- == ARCHITECHTURE ==
ARCHITECTURE BEHV OF MI IS

BEGIN

process(clock , phases)			-- Process SUR les Phases
variable gestion_ens : std_logic_vector(10 downto 0);
begin

		if rising_edge(clock) then				
		
		
					if phases = "0001" then
					
						enables <= "00000110000";		-- ReadMem , LoadInstr = 1					
						
					elsif phases = "0010" then
				
						enables <= "00011000000";	-- EnablePC , Enable_Instr = 1

					elsif phases = "0100" then		
					
						gestion_ens := decod_Instr(data_RI , phases);		-- Fonction qui va decoder les instruction et generer les bons signaux en consequence
						enables <= gestion_ens;
												
					elsif phases = "1000" then
					
						gestion_ens := decod_Instr(data_RI , phases);		-- Fonction qui va decoder les instruction et generer les bons signaux en consequence
						enables <= gestion_ens;
					else		
					
						enables <= "00000000000";	
						
					end if;	
		end if;
end process;

END BEHV ;
-- ======================

--PORT(	phases , data_RI : in std_logic_vector(3 downto 0);
		--	clock : in std_logic;
		--	Enables : out std_logic_vector(9 downto 0)
			
		--	EnableAlu , EnableAccuA , EnableAccuB , EnableInstr : out std_logic;
		--	EnablePC , ReadMem , LoadInstr , LoadA : out std_logic;
			--LoadB , EnableInpReg : out std_logic
		--	);


			
					--	ReadMem <='0';
						--LoadInstr <= '0';
						--instruc := data_RI;				-- REcup de l'instruction a effectuer sur le bus
						--EnablePC <= '1';					-- incrementation du PC => lecture intrsu suivante
						--EnableInstr <= '1';