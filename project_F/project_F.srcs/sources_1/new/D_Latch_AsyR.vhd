
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity D_latch_AsyR is
     Port ( Clr : in  STD_LOGIC;
            D   : in  STD_LOGIC;
            C   : in  STD_LOGIC;
            Q   : out STD_LOGIC;
            QN  : out STD_LOGIC);
end D_latch_AsyR;

architecture Behavioral of D_Latch_AsyR is
signal s,r,cn: std_logic; 
signal qq,qqn : std_logic; 
begin

r <= (NOT D);
Q <= qq; 
QN<= qqn;  

U1: entity work.SR_latch_asyR_En
port map(clr=>Clr, S => D, R => r, C=> C,  Q => qq, QN => qqn );

end Behavioral;