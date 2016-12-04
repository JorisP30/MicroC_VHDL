-- == LIBRAIRIES ==

library ieee;
use ieee.std_logic_1164.all;

-- MICRO INSTRUCTION MI = BOSS


-- == ENTITE ==
ENTITY MI IS
	
	PORT(	phases , data_bus : in std_logic_vector(3 downto 0);
			clock : in std_logic;
			EnableAlu , EnableAccuA , EnableAccuB , EnableInstr : out std_logic;
			EnablePC , ReadMem , LoadInstr , LoadA : out std_logic;
			LoadB , EnableInpReg : out std_logic
			);
END MI;
-- ============

-- == ARCHITECHTURE ==
ARCHITECTURE BEHV OF MI IS


BEGIN

END BEHV ;
-- ======================