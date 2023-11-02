----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:19:32 08/03/2020 
-- Design Name: 
-- Module Name:    SigGenTop - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SigGenTop is
    Port ( Reset   : in std_logic;	
         Clk    : in std_logic;
			SCK : in STD_LOGIC;
			MOSI : in  STD_LOGIC;
         SS : in  STD_LOGIC;
			An     : out std_logic_vector(3 downto 0);
			Cat    : out std_logic_vector(7 downto 0);
			LED		 : out std_logic_vector(7 downto 0);
         PWMOut : inout std_logic);
end SigGenTop;

architecture Behavioral of SigGenTop is


-- Intern signals
signal Mclk, DispClk, SigEn: std_logic;
signal Disp: std_logic_vector(19 downto 0); 
signal Ampl, Freq: std_logic_vector(7 downto 0);
signal Shape: std_logic_vector(1 downto 0);


begin

-- Sub-components

U0: entity WORK.DivClk 
    port map(Reset => Reset, Clk => Clk, TimeP => 4, Clk1 => Mclk);

U4: entity WORK.DivClk 
    port map(Reset => Reset, Clk => Clk, TimeP => 50e3, Clk1 => DispClk);

U1: entity WORK.SigGenControl 
    port map(Reset => Reset, SCK => SCK, Clk => MClk, MOSI => MOSI, SS => SS, 
	 Disp => Disp, Shape => Shape, Ampl => Ampl, Freq => Freq, SigEN=> SigEN);


U2: entity WORK.SigGenDataPath generic map (PWMinc => "0000001") 
    port map(Reset => Reset, Clk => Mclk, Shape => Shape, Ampl => Ampl, Freq => Freq, SigEN=> SigEN, PWMOut => PWMOut);

U3: entity WORK.SevenSeg5 
    port map(Reset => Reset, Clk => DispClk, Data => Disp, An => An, Cat => Cat);  

-- U5: LED <= PWMout; -- FPGA Pulse Wide Modulation output

end Behavioral;


