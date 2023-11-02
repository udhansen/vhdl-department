----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2021 09:45:15 AM
-- Design Name: 
-- Module Name: MicroController - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MicroController is
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Address_In : in STD_LOGIC_VECTOR (7 downto 0);
           Instruction_In : in STD_LOGIC_VECTOR (15 downto 0);
           V : in STD_LOGIC;
           C : in STD_LOGIC;
           N : in STD_LOGIC;
           Z : in STD_LOGIC;
           Address_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Constant_Out : out STD_LOGIC_VECTOR (7 downto 0);
           DX : out STD_LOGIC_VECTOR (3 downto 0);
           AX : out STD_LOGIC_VECTOR (3 downto 0);
           BX : out STD_LOGIC_VECTOR (3 downto 0);
           FS : out STD_LOGIC_VECTOR (3 downto 0);
           MB : out STD_LOGIC;
           MD : out STD_LOGIC;
           RW : out STD_LOGIC;
           MM : out STD_LOGIC;
           MW : out STD_LOGIC);
end MicroController;

architecture Behavioral of MicroController is

component InstructionDecoder
     Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           IR : in STD_LOGIC_VECTOR (15 downto 0);
           V,C,N,Z : in STD_LOGIC;
           PS : out STD_LOGIC_VECTOR (1 downto 0);
           IL : out STD_LOGIC;
           DX,AX,BX,FS : out STD_LOGIC_VECTOR (3 downto 0);
           MB,MD,RW,MM,MW : out STD_LOGIC);
end component;

component InstructionRegister
     Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Instruction_In : in STD_LOGIC_VECTOR (15 downto 0);
           IL : in STD_LOGIC;
           IR : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component ProgramCounter
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Address_in : in STD_LOGIC_VECTOR (7 downto 0);
           PS : in STD_LOGIC_VECTOR (1 downto 0);
           Offset : in STD_LOGIC_VECTOR (7 downto 0);
           PC : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component ZeroFiller
      Port ( IR : in STD_LOGIC_VECTOR (15 downto 0);
           ZeroFilled_8 : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component SignExtender
     Port ( IR : in STD_LOGIC_VECTOR (15 downto 0);
           Extended_8 : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal IR_sig: STD_LOGIC_VECTOR(15 downto 0);
signal IL_sig: STD_LOGIC;
signal PS_sig: STD_LOGIC_VECTOR(1 downto 0);
signal Offset_sig: STD_LOGIC_VECTOR(7 downto 0);

begin

U1: InstructionDecoder port map(RESET => RESET, CLK => CLK, IR => IR_sig, V => V, C => C, N => N, Z => Z, 
PS => PS_sig, IL => IL_sig, DX => DX, AX => AX, BX => BX, FS => FS, MB => MB, MD => MD, RW => RW, MM => MM, MW => MW);

U2: InstructionRegister port map(RESET => RESET, CLK => CLK, Instruction_In => Instruction_In, IL => IL_sig, 
IR => IR_sig);

U3: ProgramCounter port map(RESET => RESET, CLK => CLK, Address_In => Address_In, PS => PS_sig, Offset => Offset_sig, 
PC => Address_Out);

U4: ZeroFiller port map(IR => IR_sig, ZeroFilled_8 => Constant_Out);

U5: SignExtender port map(IR => IR_sig, Extended_8 => Offset_sig);
 

end Behavioral;