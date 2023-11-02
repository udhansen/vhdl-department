

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF_AsyR is
    Port ( Clr  : in  STD_LOGIC;
           D    : in  STD_LOGIC;
           C    : in  STD_LOGIC;
           Q    : out STD_LOGIC;
           QN   : out STD_LOGIC);
end D_FF_AsyR;

architecture Behavioral of D_FF_AsyR is
signal ss,rr,clr_sig,cn: std_logic; 
signal qq,qqn : std_logic; 
begin

clr_sig<=Clr;
Q <= qq; 
QN<= qqn;  
cn<=not c; 

U1: entity work.D_latch_AsyR
port map (clr=>clr_sig, D=>D, C=> cn , Q => ss, QN => rr);

U2: entity work.SR_Latch_AsyR_En
port map(Clr=>clr_sig, S => ss, R => rr, C=> C,  Q => qq, QN => qqn );

end Behavioral;