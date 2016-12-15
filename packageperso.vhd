library ieee;
use ieee.std_logic_1164.all;
Use ieee.numeric_std.all ;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_ARITH.all;		

package packageperso is	-- DEFINITION DES BLOCS
	
	component prog_count
	PORT(		clock , clear : in std_logic;
				cmd_mem : out std_logic_vector(3 downto 0));
	end component;
		
	component RAM2
	PORT
	(	address	: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	end component;
				
	component instr_reg
	PORT(	clear , clock , EnableInstr , LoadInstr: in std_logic;	-- Ajout de LoadIntsr
			E_from_M : in std_logic_vector(7 downto 0);
			to_Micro , to_bus : out std_logic_vector(3 downto 0)
			);
	end component;
		
	component ALU
	PORT( Add_sub , Enable_ALU : in std_logic; -- 0 => - 1 // => +
			from_accuA , from_accuB : in std_logic_vector(3 downto 0);
			Carry , Neg , Zero: out bit;
			Alu_to_bus  : out std_logic_vector(3 downto 0) 
			);
	end component;
		
	component Full_Add_4
	PORT( 
			A ,B: in std_logic_vector(3 downto 0);
			Cin : in std_logic;
			Qs : out std_logic_vector(3 downto 0);
			Cout : out std_logic
			);
	end component;
	
	component Full_Soust_4
	PORT( 
			A ,B: in std_logic_vector(3 downto 0);
			--Cin : in std_logic;
			Qs : out std_logic_vector(3 downto 0);
			Cout , Neg : out std_logic
			);
	end component;
		
	component Mux_2_1_4bits
	PORT( 
			A ,B: in std_logic_vector(3 downto 0);
			Sel , CA , CB , enable: in std_logic;
			S : out std_logic_vector(3 downto 0);
			S_c : out std_logic			
			);
	end component;
	
	component AccuA
	PORT(clock , reset,  EnableA  , load: in std_logic;
			to_bus : inout std_logic_vector(3 downto 0);
			to_alu  : out std_logic_vector(3 downto 0)
			);
	end component;
		
	component gene_phase
	PORT(	clock , reset : in std_logic;
			Phases : out std_logic_vector(3 downto 0)
			);
	end component;	
	
	component MI
	PORT(	phases , data_RI : in std_logic_vector(3 downto 0);
			clock : in std_logic;
			Enables : out std_logic_vector(10 downto 0)
			);
	end component;
		
	component output_reg
	PORT(	Enable_Out_Reg : in std_logic;
			from_bus : in std_logic_vector(3 downto 0);
			to_port : out std_logic_vector(3 downto 0)	
		  );
	end component;
	
	component input_reg
	PORT(	Enable_IN_reg : in std_logic;
			Data_in : in std_logic_vector(3 downto 0);
			to_bus : out std_logic_vector(3 downto 0)	
		  );
	end component;
		
	-- Package FUNCTION
	function decod_Instr(num_instr , phases: in std_logic_vector(3 downto 0))
	return  std_logic_vector ;
	
end package packageperso;

package body packageperso is
	function decod_Instr(num_instr , phases : in std_logic_vector(3 downto 0))
	return  std_logic_vector is
	
	constant NOP : std_logic_vector(3 downto 0) := "0000";
	constant ADD : std_logic_vector(3 downto 0) := "0001";
	constant SUB : std_logic_vector(3 downto 0) := "0010";
	constant Get_Input : std_logic_vector(3 downto 0) := "0011";
	constant Give_Input : std_logic_vector(3 downto 0) := "0100";
	constant LDA : std_logic_vector(3 downto 0) := "0101";
	constant jump : std_logic_vector(3 downto 0) := "0110";
	constant BRNE : std_logic_vector(3 downto 0) := "0111";
	constant BRZ : std_logic_vector(3 downto 0) := "1000";
	constant TAB : std_logic_vector(3 downto 0) := "1001";
	variable enable : std_logic_vector(10 downto 0);
	
	begin
	
					case num_instr is
							when NOP =>
									enable := "00000000000";
							-- ==========================		
							when ADD =>								
									if phases = 4 then		-- Phases 3
																		
											enable := "00110000100";		-- EnablesIstr , LoadB, EnableB actif
											
									elsif phases = 8 then	-- Phase 4
									
											enable := "11000001001";		-- EnablesALU, EnableA, LoadA, ADDSub actif											
									else									
									end if;
							-- ==========================
							when SUB =>
									if phases = 4 then		-- Phases 3
																		
											enable := "00110000100";		-- EnablesIstr , LoadB, EnableB actif
											
									elsif phases = 8 then
									
											enable := "11000001000";		-- EnablesALU, EnableA, LoadA, ADDSub actif											
									else									
									end if;
							-- ==========================
							when LDA =>
									if phases = 4 then		-- Phases 3
																		
											enable := "01010001000";		-- EnableA, LoadA, actif
											
									elsif phases = 8 then	-- Phase 4
									
											enable := "00000000000";		-- EnableA		-- "01000000000" => pour voir data de AccA sur le bus								
									else
									end if;
							-- ==========================
							when others => 
									enable := "00000000000";				-- test
							-- ==========================
					end case;
					return enable ;
			
	end decod_Instr;
end package body packageperso;