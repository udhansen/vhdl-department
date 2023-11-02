----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:39:34 08/03/2020 
-- Design Name: 
-- Module Name:    SigGenControl - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

entity SigGenControl is
  Port ( Reset  : in std_logic;	
         Clk    : in std_logic;
         SCK    : in std_logic;
         MOSI    : in std_logic;
         SS    : in std_logic;
         LED : out STD_LOGIC_VECTOR(7 downto 0);
         Shape  : inout std_logic_vector(1 downto 0);
         Ampl   : inout std_logic_vector(7 downto 0);
         Freq   : inout std_logic_vector(7 downto 0);
         Tilstand : out STD_LOGIC_VECTOR(6 downto 0);
			SigEn  : out std_logic);
end SigGenControl;

architecture Behavioral of SigGenControl is

signal nextMOSI, nextA, nextF, Sync, Checksum, ResetOUT: STD_LOGIC_VECTOR(7 downto 0);  
signal nextS: STD_LOGIC_VECTOR(1 downto 0);
signal ShapeEN, AmplEN, FreqEN, ResetEN, SyncEN, RunEN, SSold, SSPuls, ChecksumEN: STD_LOGIC;
type StateType is (ShapeS, AmplS, FreqS, RunS, SyncS, ResetS, ChecksumS);
signal State, nState: StateType;


begin

-- Shift-register
SpiReg: process(Reset, SCK)

variable BUFFreg: STD_LOGIC_VECTOR(7 downto 0);

begin
	if Reset = '1' then BUFFreg := X"00"; 	
	elsif SCK'event and SCK = '1' then 
	BUFFreg := BUFFreg(6 downto 0) & MOSI; 
	end if; 
	nextMOSI <= BUFFreg;
	LED <= BUFFreg; 
end process; 
	
ShapeRegBUFF: process (Reset, Clk)
begin
	if Reset = '1' then nextS <= "00";
	elsif Clk'event and Clk = '1' then 
		if ShapeEN = '1' then
      nextS <= nextMOSI(1 downto 0);
		end if; 
	end if; 
end process;

ShapeReg: process (Reset, Clk)
begin
	if Reset = '1' then Shape <= "00";
	elsif Clk'event and Clk = '1' then 
		if RunEN = '1' then
      Shape <= nextS;
		end if; 
	end if; 
end process;

AmplRegBUFF: process (Reset, Clk)
begin
	if Reset = '1' then nextA <= X"00";
	elsif Clk'event and Clk = '1' then 
		if AmplEN = '1' then
      nextA <= nextMOSI(7 downto 0); 
		end if; 
	end if; 
end process;

AmplReg: process (Reset, Clk)
begin
	if Reset = '1' then Ampl <= X"00";
	elsif Clk'event and Clk = '1' then 
		if RunEN = '1' then
      Ampl <= nextA; 
		end if; 
	end if; 
end process;

FregRegBUFF: process (Reset, Clk)
begin
	if Reset = '1' then nextF <= X"00";
	elsif Clk'event and Clk = '1' then 
		if FreqEN = '1' then
		nextF <= nextMOSI(7 downto 0);
		end if; 
	end if; 
end process;

FregReg: process (Reset, Clk)
begin
	if Reset = '1' then Freq <= X"00";
	elsif Clk'event and Clk = '1' then 
		if RunEN = '1' then
		Freq <= nextF;
		end if; 
	end if; 
end process;

SyncReg: process (Reset, Clk)
begin
	if Reset = '1' then Sync <= X"00";
	elsif Clk'event and Clk = '1' then 
		if SyncEN = '1' then 
		Sync <= nextMOSI(7 downto 0);
		end if; 
	end if; 
end process; 

ResetReg: process (Reset, Clk)
begin
if Reset = '1' then ResetOUT <= X"00";
	elsif Clk'event and Clk = '1' then 
		if ResetEN = '1' then 
		ResetOUT <= nextMOSI(7 downto 0);
		end if; 
	end if;
end process;  

StateReg: process (Reset, Clk)
begin
  if Reset = '1' then State <= SyncS;
  elsif Clk'event and Clk = '1' then
    State <= nState;
  end if;
end process;

SSReg: process(Reset, Clk)
begin
	if Reset = '1' then SSold <= '0';
	elsif Clk'event and Clk = '1' then
		SSold <= SS;
	end if;
end process;

SSPuls <= SS and not SSold; -- Puls til tilstandsmaskinen

ChksumReg: process(Reset, Clk)
begin
	if Reset = '1' then Checksum <= X"00";
	elsif Clk'event and Clk = '1' then
		if ChecksumEN = '1' then
		Checksum <= Sync XOR "000000" & nextS XOR nextF XOR nextA XOR ResetOUT; -- Chekker om alt er OK
		end if;
	end if;
end process;

StateDec: process(SSpuls, State, Checksum, Reset, nextMOSI)
begin
------------- Default ----------------

Tilstand <= "0000000";
ChecksumEN <= '0';
SyncEN <= '0';
RunEN <= '0';
ShapeEN <= '0';
AmplEN <= '0';
FreqEn <= '0';
SigEN <= '0';
ResetEN <= '0';
nState <= SyncS;

	case state is 

-------------- State Sync ----------------

	when SyncS => 
		SyncEN <= '1';
		Tilstand <= "0000001";
		
		if nextMOSI = "01010101" then -- 0x55
			nState <= ShapeS;
		else 
			nState <= SyncS;
		end if;


-------------- State Shape ---------------

		when ShapeS => 
		ShapeEN <= '1';
		SyncEN <= '0';
		RunEN <= '0';
		Tilstand <= "0000011";
		
		
		if SSPuls =	'1' then
		  nState <= FreqS;
		else
			nState <= ShapeS;
		end if; 

------------- State Frekvens --------------


		when FreqS =>
		FreqEN <= '1';
		ShapeEN <= '0';
		Tilstand <= "0000111";
		
		if SSPuls =	'1' then
		  nState <= AmplS;
		else 
			nState <= FreqS;
		end if; 


------------- State Amplitude ------------

		when AmplS => 
		AmplEN <= '1';
		FreqEN <= '0';
		Tilstand <= "0001111";
		
		if SSPuls =	'1' then
		  nState <= ResetS;
		else 
		nState <= AmplS;
		end if;
		
------------- State Reset ------------

		when ResetS => 
		ResetEN <= '1';
		AmplEn <='0';
		ChecksumEN <= '1';
		Tilstand <= "0011111";
		
		if nextMOSI = X"00"  then
			nState <= SyncS;
		elsif Checksum = X"00" then 
			nState <= ChecksumS;
		else 
			nState <= ResetS;
		end if;

-------------- State Checksum ------------

		when ChecksumS =>
		ResetEN <= '0';
		nState <= RunS;
		Tilstand <= "0111111";

-------------- State Run ------------------

		when RunS =>
		SigEN <= '1';
		RunEN <= '1';
		Tilstand <= "1111111";
		
		if nextMOSI = "01010101" then -- 0x55
		SyncEN <= '1';
		nState <= ShapeS;
		else
		nState <= RunS;
		end if; 
		
		when others => 
		nState <= SyncS;
		
		end case; 

end process; 

end Behavioral;
