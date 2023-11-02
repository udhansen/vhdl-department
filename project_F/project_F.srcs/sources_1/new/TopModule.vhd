----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2021 10:28:27 AM
-- Design Name: 
-- Module Name: TopModule - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TopModule is
    port (  Reset : in STD_LOGIC;
            CLK : in std_logic;
            LED : out std_logic_vector(7 downto 0);
            SW  : in std_logic_vector(7 downto 0);
            BTNC : in STD_LOGIC;
            BTNU : in STD_LOGIC;
            BTNL : in STD_LOGIC;
            BTNR : in STD_LOGIC;
            BTND : in STD_LOGIC;
            Anode : OUT std_Logic_vector(7 downto 0);
            Cathode : out std_logic_vector(7 downto 0)
        );
end TopModule;

architecture Behavioral of TopModule is

component MicroController is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Address_In : in STD_LOGIC_VECTOR (7 downto 0);
           Address_out : out STD_LOGIC_VECTOR (7 downto 0);
           Instruction_In : in STD_LOGIC_VECTOR (15 downto 0);
           Constant_Out : out STD_LOGIC_VECTOR (7 downto 0);
           V,C,N,Z : in STD_LOGIC;
           DX,AX,BX,FS : out STD_LOGIC_VECTOR (3 downto 0);
           MB,MD,RW,MM,MW : out STD_LOGIC);
end component;

component Datapath is
    port(
        RESET:          in std_logic;
        CLK:            in std_logic;
        W:              in std_logic;
        DA,AA,BA:       in std_logic_vector (3 downto 0);
        ConstantIn:     in std_logic_vector (7 downto 0); 
        MB:             in std_logic;
        FS3,FS2,FS1,FS0:in std_logic;
        DataIn:         in std_logic_vector (7 downto 0); 
        MD:             in std_logic;
        Address_Out:    out std_logic_vector (7 downto 0);
        DataOut:        out std_logic_vector(7 downto 0);
        V,C,N,Z:        out std_logic 
        );
end component;

component PortReg8x8 is
    Port ( Reset : in STD_LOGIC;
           CLK : in STD_LOGIC;
           MW : in STD_LOGIC;
           DataIn : in STD_LOGIC_VECTOR (7 downto 0);
           AddressIn : in STD_LOGIC_VECTOR (7 downto 0);
           SW : in STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC; -- BTN1
           BTNU : in STD_LOGIC; -- BTN2
           BTNL : in STD_LOGIC; -- BTN3
           BTNR : in STD_LOGIC; -- BTN4
           BTND : in STD_LOGIC; -- BTN5
           MMR : out STD_LOGIC;
           Dword : out STD_LOGIC_VECTOR (15 downto 0);
           DataOutR : out STD_LOGIC_VECTOR (15 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component MUXM is
    Port (S : in STD_LOGIC;
          Ai : in STD_LOGIC_VECTOR (7 downto 0);
          Bi : in STD_LOGIC_VECTOR (7 downto 0); 
          Go : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component MUXMR is
    Port (S : in STD_LOGIC;
          Ai : in STD_LOGIC_VECTOR (15 downto 0);
          Bi : in STD_LOGIC_VECTOR (15 downto 0); 
          Go : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component Ram256x16 is 
    port(clk: in STD_LOGIC; 
        reset: in STD_LOGIC; 
        Data_in: in STD_LOGIC_VECTOR(15 downto 0);
        Address_in : in STD_LOGIC_VECTOR(7 downto 0);
        MW: in STD_LOGIC;
        Data_out:out STD_LOGIC_VECTOR(15 downto 0));
end component;

component SevenSegDriver is
    Port ( Reset :    in  std_logic;
           Clk:       in  std_logic;    
	       Dword :  in  std_logic_vector (15 downto 0); -- Binary data
           Cathode :    out std_logic_vector(7 downto 0);  -- Common cathodes
           Anode :     out std_logic_vector(7 downto 0)); -- Common Anodes
end component;

component Debounce IS
  port ( CLK     : IN  STD_LOGIC;  --input clock
        Reset : IN  STD_LOGIC;  --asynchronous active low reset
        BTN_in  : IN  STD_LOGIC;  --input signal to be debounced
        BTN_out  : OUT STD_LOGIC); --debounced signal
END component;

component DivClk is
    port ( Reset: in STD_LOGIC;     -- Global Reset (BTN1)
           Clk: in STD_LOGIC;     -- Master Clock (50 MHz)
           TimeP: in integer;     -- Time periode of the divided clock (50e6)
           Clk1: out STD_LOGIC);   -- Divided clock1 (1 Hz)
end component;

component ZeroFiller2 is
    port (Data_Out : in STD_LOGIC_VECTOR(7 downto 0);
          Data_In : out STD_LOGIC_VECTOR(15 downto 0));
end component;

---------- signaler

-- Master clock og Reset
signal MClk, sCLK, DispCLK : STD_LOGIC;
signal Reset_sig : STD_LOGIC;
signal a : STD_LOGIC_VECTOR(1 downto 0) := "00";

-- MUXM
signal AddressIn_sig, AddressOut_sig : STD_LOGIC_VECTOR (7 downto 0);
signal MUXM_out: STD_LOGIC_VECTOR (7 downto 0);

-- MUXMR
signal DataOutR_sig, DataoutM_sig : STD_LOGIC_VECTOR(15 downto 0);
signal MMR_sig: STD_LOGIC;
signal MUXMR_out: STD_LOGIC_VECTOR (15 downto 0); -- Bruges til InstructionIn på instruktionsregister i microcontroller

-- ZeroFiller2 / Udgang af datapath
signal DataOut_sig : STD_LOGIC_VECTOR(7 downto 0); -- bruges også til DataIn på Port8x8
signal DataOut16bit_sig : STD_LOGIC_VECTOR(15 downto 0);

-- Instruction Decoder (Kontrol-word)
signal DX_sig, AX_sig, BX_sig, Fs_sig : STD_LOGIC_VECTOR(3 downto 0);
signal MB_sig, MD_sig, RW_sig, MM_sig, MW_sig: STD_LOGIC;

-- ALU
signal V_sig, C_sig, N_sig, Z_sig: STD_LOGIC;

-- Zero Filler 1
signal ConstantOut_sig : STD_LOGIC_VECTOR(7 downto 0);

-- Debounce
signal BTNC_sig, BTNU_sig, BTNL_sig, BTNR_sig, BTND_sig: STD_LOGIC;

-- Port8x8
signal Dword_sig : STD_LOGIC_VECTOR(15 downto 0);
    
begin

-- clock

process(CLK, a) is
begin
if RISING_EDGE(CLK) then
    a <= a + 1;
    sCLK <= a(1);
end if;
end process;


MClk <= Clk;


-- Reset

Reset_sig <= Reset;

U0: MicroController port map 
(Reset => Reset_sig, CLK => sCLK, Address_In => AddressIn_sig, Address_out => AddressOut_sig,
Instruction_In => MUXMR_out, Constant_Out => ConstantOut_sig, 
V => V_sig, C => C_sig ,N => N_sig, Z => Z_sig,
DX => DX_sig, AX => AX_sig, BX => BX_sig, Fs => Fs_sig,
MB => MB_sig, MD => MD_sig, RW => RW_sig, MM => MM_sig, MW => MW_sig);

U1: Datapath port map 
(Reset => Reset_sig, CLK => sCLK,
W => RW_sig, DA => DX_sig, AA => AX_sig, BA => BX_sig, 
ConstantIn => ConstantOut_sig, MB => MB_sig, 
FS3 => Fs_sig(3), FS2 => Fs_sig(2), FS1 => Fs_sig(1), FS0 => Fs_sig(0),
DataIn => MUXMR_out(7 downto 0),
MD => MD_sig, Address_out => AddressIn_sig, DataOut => DataOut_sig,
V => V_sig, C => C_sig, N => N_sig, Z => Z_sig);

U2: MUXM port map (S => MM_sig, Ai => AddressOut_sig, Bi => AddressIn_sig, Go => MUXM_out);

U3: MUXMR port map (S => MMR_sig, Ai => DataOutR_sig, Bi => DataoutM_sig, Go => MUXMR_out);

U4: Ram256x16 port map (CLK => CLK, Reset => Reset, Data_in => DataOut16bit_sig, Address_in => MUXM_out, MW => MW_sig, Data_out => DataoutM_sig);

U5: PortReg8x8 port map (Reset => Reset_sig, CLK => CLK, MW => MW_sig, 
                 DataIn => DataOut_sig, AddressIn => MUXM_out, SW => SW,
                 BTNC => BTNC_sig, BTNU => BTNU_sig, BTNL => BTNL_sig, BTNR => BTNR_sig, BTND => BTND_sig, MMR => MMR_sig, 
                 Dword => Dword_sig, DataoutR => DataOutR_sig, LED => LED);
                 
U6: DivClk port map(Reset => Reset_sig, CLK => MCLK, timeP => 50000, clk1 => DispCLK);

U7: SevenSegDriver port map(Reset => Reset_sig, CLK => DispCLK, Dword => Dword_sig, Cathode => Cathode, Anode => Anode);

U8:  Debounce PORT map  (Reset => Reset_sig, CLK => MClk, BTN_in => BTNC, BTN_out => BTNC_sig);  

U9:  Debounce PORT map  (Reset => Reset_sig, CLK => MClk, BTN_in => BTNU, BTN_out => BTNU_sig);          

U10: Debounce PORT map  (Reset => Reset_sig, CLK => MClk, BTN_in => BTNL, BTN_out => BTNL_sig);  

U11: Debounce PORT map  (Reset => Reset_sig, CLK => MClk, BTN_in => BTNR, BTN_out => BTNR_sig);  

U12: Debounce PORT map  (Reset => Reset_sig, CLK => MClk, BTN_in => BTND, BTN_out => BTND_sig);

U13: ZeroFiller2 PORT MAP (Data_Out => DataOut_sig, Data_In => DataOut16bit_sig);                   

end Behavioral;
