

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DataPath is
    port (
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
        V,C,N,Z:        out std_logic );
end DataPath;

architecture Behavioral of DataPath is

component RegisterFile is
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
end component;

component MUX8x2x1 is
    Port ( S :  in STD_LOGIC;
           Ai : in STD_LOGIC_VECTOR (7 downto 0);
           Bi : in STD_LOGIC_VECTOR (7 downto 0);
           Go : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component FunctionUnit is
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
end component;

component MUXD is
    Port ( DataIn : in STD_LOGIC_VECTOR (7 downto 0);
           Y : in STD_LOGIC_VECTOR (7 downto 0);
           MD : in STD_LOGIC;
           YY : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal ARegToFu, BRegToMux, BMuxToFu, FFuToMux, D_Data:STD_LOGIC_VECTOR(7 downto 0);


begin

Address_out<= ARegToFu; 
DataOut<=BMuxToFu;

RF : RegisterFile port map(reset=>Reset, Clk=>Clk, W=>W, DA=>DA, AA=>AA,BA=>BA, D_Data => D_Data, A_Data=>ARegToFu, B_Data=>BRegToMux);

M_B : MUX8x2x1 port map (S=>MB, Ai => ConstantIn, Bi => BRegToMux, Go=>BMuxToFu);

M_D : MUX8x2x1 port map (S=>MD, Ai=>DataIn ,Bi=>FFuToMux, Go=>D_Data);

FU : FunctionUnit port map (A=>ARegToFu, B=>BMuxToFu, FS3 => FS3, FS2 => FS2, FS1 => FS1, FS0 => FS0, V => V, C => C, N => N, Z => Z, F => FFuToMux);

--M_D1: MUXD port map (DataIn => DataIn, Y => FFuToMux, MD => MD, YY => D_Data); 
end Behavioral;