LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- entity declaration only; no definition here
ENTITY div_tb IS
	END;

	-- Architecture of the testbench with the signal names
ARCHITECTURE behaviour OF div_tb IS 

signal BoothMULsel_tb, ANDsel_tb, ORsel_tb, NOTsel_tb, NEGsel_tb, SHRsel_tb, SHLsel_tb, RORsel_tb, ROLsel_tb, SUBsel_tb, ADDsel_tb, MULsel_tb, DIVsel_tb  : std_logic;
signal PCout_tb,MDRout_tb, read_tb, Cout_tb, HIout_tb, In_Portout_tb, LOout_tb, Zhighout_tb, Zlowout_tb, IncPC_tb : std_logic;
Signal MARout_tb, R0out_tb, R1out_tb, R2out_tb, R3out_tb, R4out_tb, R5out_tb, R6out_tb, R7out_tb, R8out_tb : std_logic;
Signal R9out_tb, R10out_tb, R11out_tb, R12out_tb, R13out_tb, R14out_tb, R15out_tb  : std_LOGIC;
signal Yin_tb, Zin_tb, IRin_tb, R0in_tb, R1in_tb, R2in_tb, R3in_tb, R4in_tb, R5in_tb, R6in_tb, R7in_tb, R8in_tb, R9in_tb, R10in_tb, R11in_tb, R12in_tb, R13in_tb, R14in_tb, R15in_tb : std_LOGIC;
signal MDRin_tb, MARin_tb, Csignin_tb, Hiin_tb, In_portin_tb, Loin_tb, PCin_tb : std_LOGIC;
signal Mdatain_tb : std_LOGIC_VECTOR(31 downto 0);
signal BusMuxOut : std_LOGIC_VECTOR(31 downto 0); --these signals are all test signals
signal MDRValue : std_LOGIC_VECTOR(31 downto 0);
signal R0Value : std_LOGIC_VECTOR(31 downto 0);
signal R1Value : std_LOGIC_VECTOR(31 downto 0);
signal R2Value : std_LOGIC_VECTOR(31 downto 0); 
signal R3Value : std_LOGIC_VECTOR(31 downto 0);
signal R4Value : std_LOGIC_VECTOR(31 downto 0);
signal R5Value : std_LOGIC_VECTOR(31 downto 0);
signal R7Value : std_LOGIC_VECTOR(31 downto 0);
signal ZLoValue : std_LOGIC_VECTOR(31 downto 0);
signal YValue : std_LOGIC_VECTOR(31 downto 0);
signal PCValue : std_LOGIC_VECTOR(31 downto 0);
signal IRValue : std_LOGIC_VECTOR(31 downto 0);
signal HIValue : std_LOGIC_VECTOR(31 downto 0);
signal LOValue : std_LOGIC_VECTOR(31 downto 0);
signal ZHiValue : std_LOGIC_VECTOR(31 downto 0);

SIGNAL Clock_tb: Std_logic;

TYPE State IS (default, PC_load_p1, PC_load_p2, Reg_load2_part1, Reg_load2_part2, Reg_load3_part1, Reg_load3_part2, T0, T1, T2, T3, T4, T5, T6, Result);
SIGNAL Present_state: State := default;

-- component instantiation of the datapath
COMPONENT datapath
PORT (
clk : in std_LOGIC;
	PCout, Zlowout, MDRout, read_sel, Cout, HIout, In_Portout, LOout, Zhighout, IncPC : in std_logic;
	BoothMULsel, ANDsel, ORsel, NOTsel, NEGsel, SHRsel, SHLsel, RORsel, ROLsel, SUBsel, ADDsel, MULsel, DIVsel  : in std_logic;
	MARout, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out : in std_LOGIC;
	R9out, R10out, R11out, R12out, R13out, R14out, R15out  : in std_LOGIC;
	Yin, Zin, IRin, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in : in std_LOGIC;
	MDRin, MARin, Csignin, Hiin, In_portin, Loin, PCin : in std_LOGIC;
	Mdatain : in std_LOGIC_VECTOR(31 downto 0);
	tempBusOut : out std_LOGIC_VECTOR(31 downto 0);
	MDRValue : out std_LOGIC_VECTOR(31 downto 0);
	R0Value : out std_LOGIC_VECTOR(31 downto 0);
	R1Value : out std_LOGIC_VECTOR(31 downto 0);
	R2Value : out std_LOGIC_VECTOR(31 downto 0); 
	R3Value : out std_LOGIC_VECTOR(31 downto 0);
	R4Value : out std_LOGIC_VECTOR(31 downto 0);
	R5Value : out std_LOGIC_VECTOR(31 downto 0);
	R7Value : out std_LOGIC_VECTOR(31 downto 0);
	ZLoValue : out std_LOGIC_VECTOR(31 downto 0);
	YValue :  out std_LOGIC_VECTOR(31 downto 0);
	PCValue :  out std_LOGIC_VECTOR(31 downto 0);
	IRValue :  out std_LOGIC_VECTOR(31 downto 0);
	HIValue :  out std_LOGIC_VECTOR(31 downto 0);
	LOValue :  out std_LOGIC_VECTOR(31 downto 0);
	ZHiValue : out std_LOGIC_VECTOR(31 downto 0)
	);
END COMPONENT datapath;

BEGIN

DUT : datapath
--port mapping: between the dut and the testbench signals
PORT MAP (
PCout => PCout_tb,
Zlowout => Zlowout_tb,
MDRout => MDRout_tb,
read_sel => read_tb,
Cout => Cout_tb,   
HIout => HIout_tb, 
In_Portout => In_Portout_tb, 
LOout => LOout_tb, 
Zhighout => Zhighout_tb, 
IncPC => IncPC_tb,
ANDsel => ANDsel_tb, 
ORsel => ORsel_tb, 
NOTsel => NOTsel_tb, 
NEGsel => NEGsel_tb, 
SHRsel => SHRsel_tb, 
SHLsel => SHLsel_tb, 
RORsel => RORsel_tb, 
ROLsel => ROLsel_tb, 
SUBsel => SUBsel_tb, 
ADDsel => ADDsel_tb, 
MULsel => MULsel_tb, 
DIVsel => DIVsel_tb, 
BoothMULsel => BoothMULsel_tb,
R0out => R0out_tb,
R1out => R1out_tb, 
R2out => R2out_tb,
R3out => R3out_tb, 
R4out => R4out_tb, 
R5out => R5out_tb, 
R6out => R6out_tb, 
R7out => R7out_tb, 
R8out => R8out_tb, 
R9out => R9out_tb, 
R10out => R10out_tb, 
R11out => R11out_tb, 
R12out => R12out_tb,
R13out => R13out_tb, 
R14out => R14out_tb,
R15out => R15out_tb,
R0in => R0in_tb,
R1in => R1in_tb,
R2in => R2in_tb,
R3in => R3in_tb,
R4in => R4in_tb, 
R5in => R5in_tb,
R6in => R6in_tb, 
R7in => R7in_tb,
R8in => R8in_tb, 
R9in => R9in_tb, 
R10in => R10in_tb, 
R11in => R11in_tb, 
R12in => R12in_tb, 
R13in => R13in_tb, 
R14in => R14in_tb, 
R15in => R15in_tb, 
MDRin => MDRin_tb,
Csignin => Csignin_tb, 
Hiin => Hiin_tb,
In_portin => In_Portin_tb, 
Loin => Loin_tb, 
MARin => MARin_tb,
MARout => MARout_tb,
PCin => PCin_tb,
IRin => IRin_tb,
Mdatain => Mdatain_tb,
Clk => Clock_tb,
Zin => Zin_tb,
Yin => Yin_tb,
tempBusOut => BusMuxOut,
MDRValue => MDRValue,
R0Value => R0Value,
R1Value => R1Value,
R2Value => R2Value,
R3Value => R3Value,
R4Value => R4Value,
R5Value => R5Value,
R7Value => R7Value,
ZLoValue => ZLoValue,
YValue => YValue,
PCValue => PCValue,
IRValue => IRValue,
HIValue => HIValue,
LOValue => LOValue,
ZHiValue => ZHiValue
);

clk_process :process
begin 
		clock_tb <= '0';
		wait for 20ns;  
		clock_tb <= '1';
		wait for 10ns;  
end process;

firstProc : PROCESS (Clock_tb) is -- finite state machine
BEGIN
		IF (Clock_tb'EVENT AND Clock_tb = '1') THEN -- if clock rising-edge
				CASE Present_state IS
						WHEN Default =>
								Present_state <= PC_load_p1;
						WHEN PC_load_p1 =>
								Present_state <= PC_load_p2;
						WHEN PC_load_p2 =>
								Present_state <= Reg_load2_part1;
						WHEN Reg_load2_part1 =>
								Present_state <= Reg_load2_part2;
						WHEN Reg_load2_part2 =>
								Present_state <= Reg_load3_part1;
						WHEN Reg_load3_part1 =>
								Present_state <= Reg_load3_part2;
						WHEN Reg_load3_part2 =>		
								Present_state <= T0;
						WHEN T0 =>
								Present_state <= T1;
						WHEN T1 =>
								Present_state <= T2;
						WHEN T2 =>
								Present_state <= T3;
						WHEN T3 =>
								Present_state <= T4;
						WHEN T4 =>
								Present_state <= T5;
						WHEN T5 =>
								Present_state <= T6;
						WHEN T6 =>
								Present_state <= Result;
						WHEN OTHERS =>
				END CASE;
		END IF;
END PROCESS;

SecondProc : PROCESS (Present_state) -- do the required job in each state
BEGIN
				CASE Present_state IS -- assert the required signals in each clock cycle
						WHEN Default =>
								PCout_tb <= '0'; Zlowout_tb <= '0'; ZHighout_tb <= '0'; MDRout_tb <= '0'; -- initialize the signals
								R1out_tb <= '0'; MARin_tb <= '0'; Zin_tb <= '0';
								PCin_tb <='0'; MDRin_tb <= '0'; IRin_tb <= '0'; Yin_tb <= '0';
								R3in_tb <= '0'; IncPC_tb <= '0'; Read_tb <= '0'; DIVsel_tb <= '0';
								R3Out_tb <= '0'; R1in_tb <= '0'; HIin_tb <= '0'; LOin_tb <= '0'; 	
						WHEN PC_load_p1 =>
								Mdatain_tb <= x"00000000";
								Read_tb <= '1'; 
								MDRin_tb <= '1'; 
						WHEN PC_load_p2 =>
								Read_tb <= '0';
								MDRin_tb <= '0';
								MDRout_tb <= '1'; 
								PCin_tb <= '1'; 
						WHEN Reg_load2_part1 =>
								MDRout_tb <= '0';
								PCin_tb <= '0';
								Mdatain_tb <= x"00000016"; 
								Read_tb <= '1'; 
								MDRin_tb <= '1'; 
						WHEN Reg_load2_part2 =>
								Read_tb <= '0';
								MDRin_tb <= '0';
								MDRout_tb <= '1'; 
								R3in_tb <= '1'; 	
						WHEN Reg_load3_part1 =>
								MDRout_tb <= '0';
								R3in_tb <= '0';
								Mdatain_tb <= x"00000014"; 
								Read_tb <= '1'; 
								MDRin_tb <= '1'; 
						WHEN Reg_load3_part2 =>		
								Read_tb <= '0'; 
								MDRin_tb <= '0';
								MDRout_tb <= '1'; 
								R1in_tb <= '1'; 
						WHEN T0 =>
								MDRout_tb <= '0'; R1in_tb <= '0';
								PCout_tb <= '1'; 
								MARin_tb <= '1'; IncPC_tb <= '1'; Zin_tb <= '1';
						WHEN T1 =>
								MARin_tb <= '0'; IncPC_tb <= '0';
								PCout_tb <= '0'; Zlowout_tb <= '1'; PCin_tb <= '1';
								Mdatain_tb(31 downto 0) <= x"88000000"; -- opcode for div R3, R1
								Read_tb <= '1'; MDRin_tb <= '1';
						WHEN T2 =>
								MDRout_tb <= '1'; IRin_tb <= '1'; PCin_tb <= '0';
								Zlowout_tb <= '0'; MDRin_tb <= '0'; Read_tb <= '0';
						WHEN T3 =>
								MDRout_tb <= '0'; IRin_tb <= '0'; 
								R3out_tb <= '1'; Yin_tb <= '1';
						WHEN T4 =>
								R3out_tb <= '0'; Yin_tb <= '0';
								R1out_tb <= '1'; DIVsel_tb <= '1'; Zin_tb <= '1';
						WHEN T5 =>
								R1out_tb <= '0'; Zin_tb <= '0';
								Zlowout_tb <= '1'; LOin_tb <= '1';
						WHEN T6 => 
								Zlowout_tb <= '0'; LOin_tb <= '0';
								ZHighout_tb <= '1'; HIin_tb <= '1';
						WHEN Result =>
								ZHighout_tb <= '0'; HIin_tb <= '0';		
						WHEN OTHERS =>
				END CASE;
		END PROCESS;

END ARCHITECTURE;