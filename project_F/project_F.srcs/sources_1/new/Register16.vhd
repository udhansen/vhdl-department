library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register16 is
generic (width : integer:=8);
    Port ( Reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           load : in STD_LOGIC_vector(15 downto 0);
           D_data : in STD_LOGIC_vector(width-1 downto 0);
           R0, R1, R2, R3, R4, R5, R6, R7 :  out STD_LOGIc_vector (width-1 downto 0);
           R8, R9, R10,R11,R12,R13,R14,R15 : out STD_LOgIC_vector (width-1 downto 0));
end Register16;

architecture Behavioral of Register16 is
component D_FF_AsyR_En is
port(D:     in std_logic;
     Reset: in std_logic; 
     En:    in std_logic;
     C :    in std_logic;
     Q :    out std_logic);
end component; 

begin

RegR0: for i in 0 to (width-1) generate 
U0: component D_FF_AsyR_En
port map(D_data(i), Reset, load(0), clk, R0(i));
end generate RegR0;     

RegR1: for i in 0 to (width-1) generate 
U1: component D_FF_AsyR_En
port map(D_data(i), Reset, load(1), clk, R1(i));
end generate RegR1;     


RegR2: for i in 0 to (width-1) generate 
U2: component D_FF_AsyR_En
port map(D_data(i), Reset, load(2), clk, R2(i));
end generate RegR2;     

RegR3: for i in 0 to (width-1) generate 
U3: component D_FF_AsyR_En
port map(D_data(i), Reset, load(3), clk, R3(i));
end generate RegR3;     

RegR4: for i in 0 to (width-1) generate 
U4: component D_FF_AsyR_En
port map(D_data(i), Reset, load(4), clk, R4(i));
end generate RegR4;     

RegR5: for i in 0 to (width-1) generate 
U5: component D_FF_AsyR_En
port map(D_data(i), Reset, load(5), clk, R5(i));
end generate RegR5;     

RegR6: for i in 0 to (width-1) generate 
U6: component D_FF_AsyR_En
port map(D_data(i), Reset, load(6), clk, R6(i));
end generate RegR6;     

RegR7: for i in 0 to (width-1) generate 
U7: component D_FF_AsyR_En
port map(D_data(i), Reset, load(7), clk, R7(i));
end generate RegR7;     

RegR8: for i in 0 to (width-1) generate 
U8: component D_FF_AsyR_En
port map(D_data(i), Reset, load(8), clk, R8(i));
end generate RegR8;     

RegR9: for i in 0 to (width-1) generate 
U9: component D_FF_AsyR_En
port map(D_data(i), Reset, load(9), clk, R9(i));
end generate RegR9;     

RegR10: for i in 0 to (width-1) generate 
U10: component D_FF_AsyR_En
port map(D_data(i), Reset, load(10), clk, R10(i));
end generate RegR10;     

RegR11: for i in 0 to (width-1) generate 
U11: component D_FF_AsyR_En
port map(D_data(i), Reset, load(11), clk, R11(i));
end generate RegR11;     

RegR12: for i in 0 to (width-1) generate 
U12: component D_FF_AsyR_En
port map(D_data(i), Reset, load(12), clk, R12(i));
end generate RegR12;     

RegR13: for i in 0 to (width-1) generate 
U13: component D_FF_AsyR_En
port map(D_data(i), Reset, load(13), clk, R13(i));
end generate RegR13;     

RegR14: for i in 0 to (width-1) generate 
U14: component D_FF_AsyR_En
port map(D_data(i), Reset, load(14), clk, R14(i));
end generate RegR14;     

RegR15: for i in 0 to (width-1) generate 
U15: component D_FF_AsyR_En
port map(D_data(i), Reset, load(15), clk, R15(i));
end generate RegR15;     

end Behavioral;