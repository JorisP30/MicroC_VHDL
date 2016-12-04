-- == LIBRAIRIES ==

library ieee;
Use ieee.numeric_std.all ;
use ieee.std_logic_1164.all;
library work;
use work.packageperso.all;

-- == ENTITE ==
ENTITY micro_main IS
	
	PORT(	
			-- POUR LE ProgCOUNT
			--clock , clear : in std_logic;	
			--cmd_adr_mem : out std_logic_vector(3 downto 0)
			-- ================================
			
			-- RAM
			--cmd_adr_mem : in std_logic_vector(3 downto 0);
		   --clock : in std_logic;
			--E_from_M : out std_logic_vector(7 downto 0)
			--======================================
			
			-- PC + RAM
			--clock  , clear : in std_logic;
			--q : out std_logic_vector(7 downto 0)
			--===========================				
					
			
			-- Instr_Reg			
			--clear , clock , EnableInstr : in std_logic;
			--E_from_M : in std_logic_vector(7 downto 0);
			--to_Micro , to_bus : out std_logic_vector(3 downto 0))
			-- ============================
							
			-- PC + RAM + Istr_reg
			--clock  , clear , enable_instr : in  std_logic;			
			--to_Micro , to_bus : out std_logic_vector(3 downto 0)
			-- =====================================
			
			
			-- ALU
			--Add_sub ,  Enable_ALU : in std_logic; -- 0 => - 1 // => +
			--from_accuA , from_accuB : in std_logic_vector(3 downto 0);
			--Carry , Neg , Zero: out bit;
			--Alu_to_bus  : out std_logic_vector(3 downto 0)
			-- =============================================
			
			
			-- Full_Add_4		
			--A ,B: in std_logic_vector(3 downto 0);
			--Cin : in std_logic;
			--Qs : out std_logic_vector(3 downto 0);
			--Cout : out std_logic
			-- =====================
			
			-- Full_Soust_4		
			--A ,B: in std_logic_vector(3 downto 0);
			--Cin : in std_logic;
			--Qs : out std_logic_vector(3 downto 0);
			--Cout : out std_logic
			-- =====================
			
			
			-- AccuA
			clock , reset, EnableA  , load : in std_logic;
			to_bus : inout std_logic_vector(3 downto 0);
			to_alu  : out std_logic_vector(3 downto 0)
			-- ======================
			
			-- AccuB
			--clock , reset, EnableB  , load : in std_logic;
			--to_bus : inout std_logic_vector(3 downto 0);
			--to_alu  : out std_logic_vector(3 downto 0)
			-- ======================
			
			
			-- Accu A + AccuB + ALU
			--Enable_ALU , EnableA , EnableB , Add_Sub , clock , Load : in std_logic;
			--data_bus : inout std_logic_vector(3 downto 0);
			--Neg , zero , carry : out bit
			
			-- ==================================
			
			-- GENE PHASES
			--clock , reset : in std_logic;
			--Phases : out std_logic_vector(3 downto 0)
			-- =========================
			
			);					
END micro_main ;
-- ============

-- == ARCHITECHTURE ==
ARCHITECTURE BEHV OF micro_main IS
--SIGNAL cmd_adr_mem : std_logic_vector(3 downto 0);
--signal E_from_M : std_logic_vector(7 downto 0);

--signal AccuA_to_ALU , AccuB_to_ALU : std_logic_vector(3 downto 0);			-- Accu A + AccuB + ALU
 
BEGIN
	
	--Prog_C : prog_count port map(clock , clear , cmd_adr_mem);
	--RAM_1 : RAM2 port map(cmd_adr_mem , clock , "00000000", '0' , q);
	--RAM_1 : RAM2 port map(cmd_adr_mem , clock , "00000000", '0' , E_from_M);
	--RI : instr_reg port map(clear , clock , enable_instr , E_from_M , to_Micro , to_bus);	
	--Alu_1 : ALU port map(Add_sub , Enable_ALU,  from_accuA , from_accuB , Carry , Neg , Zero , Alu_to_bus);
	
	--============= ACCAB + ALU
	Accu_A : AccuA port map(clock ,  EnableA , Load , data_bus , AccuA_to_ALU);
	--Accu_B : AccuA port map(clock ,  EnableB , Load , data_bus , AccuB_to_ALU);
	--ALU1 : ALU port map(Add_Sub , Enable_ALU , AccuA_to_ALU , AccuB_to_ALU , carry , Neg , zero , data_bus);
	--============================
	
	--Full_add : Full_Add_4 port map(A , B , Cin , Qs , Cout);
	--Full_Soust : Full_Soust_4 port map(A , B , '1' , Qs , Cout); 
	
	--gen_phases : gene_phase port map(clock , reset , Phases);
	
	
END BEHV ;
-- ======================