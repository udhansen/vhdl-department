
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegisterFile is
    Port ( 
       Reset  : in STD_LOGIC;
       Clk    : in STD_LOGIC;
       W      : in STD_LOGIC;
       DA     : in STD_LOGIC_VECTOR (3 downto 0);
       AA     : in STD_LOGIC_VECTOR (3 downto 0);
       BA     : in STD_LOGIC_VECTOR (3 downto 0);
       D_Data : in STD_LOGIC_VECTOR (7 downto 0);
       A_Data : out STD_LOGIC_VECTOR (7 downto 0);
       B_Data : out STD_LOGIC_VECTOR (7 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

component DestinationDecoder is
    port(
        write: in std_logic;
        DA   : in std_logic_vector(3 downto 0);
        Load : out std_logic_vector(15 downto 0)); 
End component;

component Register16 is 
    port(
        reset   : in std_logic;
        Clk     : in std_logic;
        Load    : in std_logic_vector(15 downto 0);
        D_Data  : in std_logic_vector(7 downto 0);
        R0, R1, R2, R3, R4, R5, R6, R7 :  out STD_LOGIC_vector (7 downto 0);
        R8, R9, R10,R11,R12,R13,R14,R15 : out STD_LOGIC_vector (7 downto 0)); 
end component; 

component MUX16x8 is 
    port(
        R0, R1, R2, R3, R4, R5, R6, R7 :  in STD_LOGIC_vector (7 downto 0);
        R8, R9, R10,R11,R12,R13,R14,R15 : in STD_LOGIC_vector (7 downto 0);
        D_Select: in STD_LOGIC_vector (3 downto 0);
        Y_Data: out STD_LOGIC_vector (7 downto 0)); 
end component;

signal loadSig: std_logic_vector(15 downto 0);
signal R0, R1, R2, R3, R4, R5, R6, R7 :   STD_LOGIC_vector (7 downto 0);
signal R8, R9, R10,R11,R12,R13,R14,R15 :  STD_LOGIC_vector (7 downto 0);

begin

DD : DestinationDecoder port map(write=>W, DA=>DA, load=>loadSig);

R16: Register16 port map(reset=>reset,Clk=>Clk,Load=>LoadSig ,D_Data=>D_Data, R0=>R0, R1=>R1, R2=>R2, R3=>R3, 
R4=>R4, R5=>R5, R6=>R6, R7=>R7,R8=>R8,R9=>R9,R10=>R10,R11=>R11,R12=>R12,R13=>R13,R14=>R14,R15=>R15);

M_A : MUX16x8 port map(D_Select=>AA,Y_Data=>A_Data, R0=>R0, R1=>R1, R2=>R2, R3=>R3, 
R4=>R4, R5=>R5, R6=>R6, R7=>R7,R8=>R8,R9=>R9,R10=>R10,R11=>R11,R12=>R12,R13=>R13,R14=>R14,R15=>R15);

M_B : MUX16x8 port map(D_Select=>BA,Y_Data=>B_Data,R0=>R0, R1=>R1, R2=>R2, R3=>R3, 
R4=>R4, R5=>R5, R6=>R6, R7=>R7,R8=>R8,R9=>R9,R10=>R10,R11=>R11,R12=>R12,R13=>R13,R14=>R14,R15=>R15);

end Behavioral;
