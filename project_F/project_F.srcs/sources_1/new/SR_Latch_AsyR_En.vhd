

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SR_latch_asyR_En is
    Port ( S : in STD_LOGIC;
           R : in STD_LOGIC;
           C : in STD_LOGIC;
           Clr : in STD_LOGIC;
           Q : out STD_LOGIC;
           QN : out STD_LOGIC);
end SR_latch_asyR_En;

architecture Behavioral of SR_latch_asyR_En is

signal SN, RN:  std_logic; 
signal qq, qqn: std_logic; 

begin

Q  <=qq; 
QN <=qqn; 
sn <=S nand C;  
rn <=R nand C;  


U1: entity work.SR_Latch_AsyR
port map(clr=>Clr,SN => sn, RN => rn, Q => qq, QN => qqn );


end Behavioral;
