----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2021 10:54:29 AM
-- Design Name: 
-- Module Name: FU - Behavioral
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

entity FunctionUnit is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           FS3 : in STD_LOGIC;
           FS2 : in STD_LOGIC;
           FS1 : in STD_LOGIC;
           FS0 : in STD_LOGIC;
           V : out STD_LOGIC;
           C : out STD_LOGIC;
           N : out STD_LOGIC;
           Z : out STD_LOGIC;
           F : out STD_LOGIC_VECTOR (7 downto 0));
end FunctionUnit;

architecture Behavioral of FunctionUnit is

signal MF_sig : STD_LOGIC;
signal Hsel_sig : STD_LOGIC_VECTOR (1 downto 0);
signal Jsel_sig : STD_LOGIC_VECTOR (3 downto 0);
signal HtoS_sig, JtoR_sig, MUXFtoNeg_sig, F_sig: STD_LOGIC_VECTOR (7 downto 0);


component FDEC is
    Port ( FS3 : in STD_LOGIC;
           FS2 : in STD_LOGIC;
           FS1 : in STD_LOGIC;
           FS0 : in STD_LOGIC;
           J_Select : out STD_LOGIC_VECTOR (3 downto 0);
           H_Select : out STD_LOGIC_VECTOR (1 downto 0);
           MF : out STD_LOGIC);
end component FDEC;

component ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           J_Select : in STD_LOGIC_VECTOR (3 downto 0);
           G : out STD_LOGIC_VECTOR (7 downto 0);
           V : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component ALU;

component Shifter
    Port ( B : in STD_LOGIC_VECTOR (7 downto 0);
       H_Select : in STD_LOGIC_VECTOR (1 downto 0);
       H : out STD_LOGIC_VECTOR (7 downto 0));
end component Shifter;

component MUXF
    Port ( R : in STD_LOGIC_VECTOR (7 downto 0);
       S : in STD_LOGIC_VECTOR (7 downto 0);
       MUX_Select : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (7 downto 0));
       --YY : out STD_LOGIC_VECTOR (7 downto 0));
end component MUXF;

component NegZero
    Port ( MUXF : in STD_LOGIC_VECTOR (7 downto 0);
       N : out STD_LOGIC;
       Z : out STD_LOGIC);
end component NegZero;

begin

u1: FDEC port map (FS3 => FS3, FS2 => FS2, FS1 => FS1, FS0 => FS0,
                   J_Select => Jsel_sig, H_Select => Hsel_sig, MF => MF_sig);

u2: ALU port map (A => A, B => B, J_Select => Jsel_sig, 
                  G => JtoR_sig, V => V, Cout => C);
                  
u3: Shifter port map (B => B, H_Select => Hsel_sig, 
                      H => HtoS_sig);
                      
u4: MUXF port map (R => JtoR_sig, S => HtoS_sig, MUX_Select => MF_sig,
                   Y => F_sig);
    F <= F_sig;
    MUXFtoNeg_sig <= F_sig;
    
u5: NegZero port map (MUXF => MUXFtoNeg_sig, N => N, Z => Z);

end Behavioral;
