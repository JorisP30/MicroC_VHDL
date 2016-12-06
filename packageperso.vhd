library ieee;
use ieee.std_logic_1164.all;
Use ieee.numeric_std.all ;
		
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
	PORT(	clear , clock , EnableInstr : in std_logic;
			E_from_M : in std_logic_vector(7 downto 0);
			to_Micro , to_bus : out std_logic_vector(3 downto 0));
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
end package packageperso;