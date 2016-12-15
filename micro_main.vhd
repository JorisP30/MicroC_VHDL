-- == LIBRAIRIES ==

library ieee;
Use ieee.numeric_std.all ;
use ieee.std_logic_1164.all;
library work;
use work.packageperso.all;

-- == ENTITE ==
ENTITY micro_main IS
	
	PORT(				
			-- Gene phase + MI + PC + RAM + RI 		++ ALU + ACCUAB
			reset_gene , clock_gene , clock_MI , clear_PC , clear_RI , clock_RI  , resetA , resetB: in std_logic;
		   clock_A , clock_B : in std_logic;
			Carry , Neg , Zero: out bit;
			out_data : out std_logic_vector(3 downto 0)		-- Pour debugage	
			);					
END micro_main ;
-- ============

-- == ARCHITECHTURE ==
ARCHITECTURE BEHV OF micro_main IS

 signal enables : std_logic_vector(10 downto 0);		-- Enables Mods
 signal phases , to_micro , cmd_mem , data_bus : std_logic_vector(3 downto 0);
 signal accuA_to_ALU , accuB_to_ALU : std_logic_vector(3 downto 0);
 signal s_mem : std_logic_vector(7 downto 0);

BEGIN	
		--
		gene_ph : gene_phase port map(clock_gene , reset_gene , phases);
		MicroIn : MI port map( phases , to_micro , clock_MI , enables );
		PC : prog_count port map( enables(6) , Clear_PC , cmd_mem);
		RAM : RAM2 port map(cmd_mem , enables(5) , "00000000" , '0' , s_mem);
		RI : instr_reg port map(clear_RI , clock_RI , enables(7) , enables(4) , s_mem , to_micro , data_bus);
		
		AccumA : AccuA  port map (clock_A , resetA , enables(9) , enables(3) , data_bus , accuA_to_ALU );
		AccumB : AccuA  port map (clock_B   , resetB , enables(8) , enables(2) , data_bus ,  accuB_to_ALU);
		Alu1 : ALU port map(enables(0) , enables(10) , accuA_to_ALU , accuB_to_ALU , Carry , Neg , Zero , data_bus);
		--
		out_data <= data_bus;			-- Pour pouvoir visualiser les données du bus interne
		
	
END BEHV ;
-- ======================


-- PRT AMP

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
			--Cout , Neg : out std_logic
			-- =====================
			
			-- Mux
			--A ,B : in std_logic_vector(3 downto 0);
			--Sel , CA , CB , enable: in std_logic;
			--S : out std_logic_vector(3 downto 0);
			--S_c : out std_logic
			
			
			-- AccuA
			--clock , reset, EnableA  , load : in std_logic;
			--to_bus : inout std_logic_vector(3 downto 0);
			--to_alu  : out std_logic_vector(3 downto 0)
			-- ======================
			
			-- AccuB
			--clock , reset, EnableB  , load : in std_logic;
			--to_bus : inout std_logic_vector(3 downto 0);
			--to_alu  : out std_logic_vector(3 downto 0)
			-- ======================
			
			
			-- Accu A + AccuB + ALU
			--Enable_ALU , EnableA , EnableB , reset, Add_Sub , clock , Load : in std_logic;
			--data_bus : inout std_logic_vector(3 downto 0);
			--Neg , zero , carry : out bit
			
			-- ==================================
			
			-- GENE PHASES
			--clock , reset : in std_logic;
			--Phases : out std_logic_vector(3 downto 0)
			-- =========================
			
			-- ========= Gene phase + MI ===	
			--reset_gene , clock_gene , clock_MI: in std_logic;
			--data_bus : in std_logic_vector(3 downto 0);
			--EnableAlu , EnableAccuA , EnableAccuB , EnableInstr : out std_logic;
			--EnablePC , ReadMem , LoadInstr , LoadA : out std_logic;
			--LoadB , EnableInpReg : out std_logic	
			-- ========================
			
			-- Gene phase + MI + PC
			--reset_gene , clock_gene , clock_MI , clear_PC: in std_logic;
			--data_bus : in std_logic_vector(3 downto 0);			
		   --cmd_mem : out std_logic_vector(3 downto 0)
			--==============================
			
			
			-- Gene phase + MI + PC + RAM
			--reset_gene , clock_gene , clock_MI , clear_PC: in std_logic;
			--data_bus : in std_logic_vector(3 downto 0);
			--data_RAM : out std_logic_vector(7 downto 0)
			
			--==============================
			
			
			-- Gene phase + MI + PC + RAM + RI
			--reset_gene , clock_gene , clock_MI , clear_PC , clear_RI , clock_RI: in std_logic;
			--data_bus : inout std_logic_vector(3 downto 0)
			
			
			--==============================
			
			-- Gene_Phase + MI + PC + RAM + Mux_1_1 + RI + bus =====
			--reset_gene , clock_gene , clock_MI , Clear_PC , clear_RI , clock_RI: in std_logic;
			--data_bus : out std_logic_vector(3 downto 0)			
			-- ==================================

			-- Test Function
			--entre : in std_logic_vector(3 downto 0);
			--en1 : out std_logic_vector(9 downto 0)	
			-- ==============================


-- ============




-- Signaux ::



--SIGNAL cmd_adr_mem : std_logic_vector(3 downto 0);
--signal E_from_M : std_logic_vector(7 downto 0);

--signal AccuA_to_ALU , AccuB_to_ALU : std_logic_vector(3 downto 0);			-- Accu A + AccuB + ALU

--signal phases : std_logic_vector(3 downto 0); -- Gene + MI

-- ==== Gene_Phase + MI + PC + RAM + Mux_1_1 + RI + bus
--signal phases , s_PC , to_micro : std_logic_vector(3 downto 0); 
--signal s_RAM , S_mux_11: std_logic_vector(7 downto 0);
--signal EnableAlu , EnableAccuA , EnableAccuB , EnableInstr : std_logic;
--signal EnablePC , ReadMem , LoadInstr , LoadA : std_logic;
--signal LoadB , EnableInpReg : std_logic;
-- ======================================= 
 
 
 -- Gene phase + MI + PC
 --signal phases : std_logic_vector(3 downto 0);
 --signal EnableAlu , EnableAccuA , EnableAccuB , EnableInstr : std_logic;
 --signal EnablePC , ReadMem , LoadInstr , LoadA : std_logic;
 --signal LoadB , EnableInpReg : std_logic;
 -- ======================
 
 
  -- Gene phase + MI + PC + RAM
 --signal phases , cmd_mem: std_logic_vector(3 downto 0);
-- signal EnableAlu , EnableAccuA , EnableAccuB , EnableInstr : std_logic;
-- signal EnablePC , ReadMem , LoadInstr , LoadA : std_logic;
-- signal LoadB , EnableInpReg : std_logic;
 -- ======================
 
   -- Gene phase + MI + PC + RAM + RI
 --signal phases , cmd_mem , to_micro : std_logic_vector(3 downto 0);
 --signal EnableAlu , EnableAccuA , EnableAccuB , EnableInstr : std_logic;
 --signal EnablePC , ReadMem , LoadInstr , LoadA : std_logic;
 --signal LoadB , EnableInpReg : std_logic;
 --signal s_mem : std_logic_vector(7 downto 0);
 -- ======================


-- =====================





--enables   <= decod_Instr(entre);
		--en1 <= enables;
		
		--en2 <= toto;
	-- Gene_Phase + MI + PC + RAM + RI
	--generateur_ph : gene_phase port map(clock_gene , reset_gene , phases);	
--	MicroIn : MI port map(phases , to_micro , clock_MI , EnableAlu , EnableAccuA , EnableAccuB , EnableInstr , EnablePC , ReadMem , LoadInstr , LoadA , LoadB , EnableInpReg);
 --  PC : prog_count port map(EnablePC , Clear_PC , cmd_mem);
--	RAM : RAM2 port map(cmd_mem , ReadMem , "00000000" , '0' , s_mem);
--	RI : instr_reg port map(clear_RI , clock_RI , EnableInstr , LoadInstr , s_mem , to_micro , data_bus);	
	-- =============================
	
	-- Gene_Phase + MI + PC + RAM
	--generateur_ph : gene_phase port map(clock_gene , reset_gene , phases);
	--MicroIn : MI port map(phases , data_bus , clock_MI , EnableAlu , EnableAccuA , EnableAccuB , EnableInstr , EnablePC , ReadMem , LoadInstr , LoadA , LoadB , EnableInpReg);
   --PC : prog_count port map(EnablePC , Clear_PC , cmd_mem);
	--RAM : RAM2 port map(cmd_mem , ReadMem , "00000000" , '0' , data_RAM);
	-- ======================


	-- Gene_Phase + MI + PC
	--generateur_ph : gene_phase port map(clock_gene , reset_gene , phases);
	--MicroIn : MI port map(phases , data_bus , clock_MI , EnableAlu , EnableAccuA , EnableAccuB , EnableInstr , EnablePC , ReadMem , LoadInstr , LoadA , LoadB , EnableInpReg);
   --PC : prog_count port map(EnablePC , Clear_PC , cmd_mem);
	-- ======================

	-- === Gene_Phase + MI + PC + RAM + Mux_1_1 + RI + bus =====
	--generateur_ph : gene_phase port map(clock_gene , reset_gene , phases);
	--MicroIn : MI port map(phases , to_micro , clock_MI , EnableAlu , EnableAccuA , EnableAccuB , EnableInstr , EnablePC , ReadMem , LoadInstr , LoadA , LoadB , EnableInpReg);
	--PC : prog_count port map(EnablePC , Clear_PC , s_PC);
	--RAM : RAM2 port map(s_PC , ReadMem, "00000000" , '0', s_RAM );
	--Mux_RAM_RI : Mux_1_1 port map(ReadMem , s_RAM , S_mux_11 );
	--RI : instr_reg port map(clear_RI , clock_RI , EnableInstr , LoadInstr , s_RAM , to_micro , data_bus);
	-- ================================
		
	--Prog_C : prog_count port map(clock , clear , cmd_adr_mem);
	--RAM_1 : RAM2 port map(cmd_adr_mem , clock , "00000000", '0' , q);
	--RAM_1 : RAM2 port map(cmd_adr_mem , clock , "00000000", '0' , E_from_M);
	--RI : instr_reg port map(clear , clock , enable_instr , E_from_M , to_Micro , to_bus);	
	--Alu_1 : ALU port map(Add_sub , Enable_ALU,  from_accuA , from_accuB , Carry , Neg , Zero , Alu_to_bus);
	
	--Accu_A : AccuA port map(clock , reset , EnableA, load , to_bus , to_ALU);
	
	
	--============= ACCAB + ALU
	--Accu_A : AccuA port map(clock , reset , EnableA  , Load , data_bus , AccuA_to_ALU);
	--Accu_B : AccuA port map(clock , reset , EnableB  , Load , data_bus , AccuB_to_ALU);
	--ALU1 : ALU port map(Add_Sub , Enable_ALU , AccuA_to_ALU , AccuB_to_ALU , carry , Neg , zero , data_bus);
	--============================
	
	--Mux : Mux_2_1_4bits port map(A ,B , Sel, CA, CB, Enable , S , S_c);
	
	
	--Full_add : Full_Add_4 port map(A , B , Cin , Qs , Cout);
	--Full_Soust : Full_Soust_4 port map(A , B , Qs , Cout , Neg); 
	
	--gen_phases : gene_phase port map(clock , reset , Phases);
	
	-- ========= Gene phase + MI ===	
	--generateur_ph : gene_phase port map(clock_gene , reset_gene , phases);
	--MicroIns : MI port map(phases , data_bus , clock_MI , EnableAlu , EnableAccuA , EnableAccuB , EnableInstr , EnablePC , ReadMem , LoadInstr , LoadA , LoadB , EnableInpReg);
	-- ========================