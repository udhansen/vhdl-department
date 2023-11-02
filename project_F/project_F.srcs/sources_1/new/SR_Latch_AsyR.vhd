library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SR_Latch_AsyR is
    Port ( Clr : in  STD_LOGIC;
           SN :  in  STD_LOGIC;
           RN :  in  STD_LOGIC;
           Q :   out STD_LOGIC;
           QN :  out STD_LOGIC);
end SR_Latch_AsyR;

architecture Behavioral of SR_Latch_AsyR is
Signal qq, qqn: std_logic;

begin

Q    <=qq;
QN   <=qqn; 
qq   <=SN nand qqn;  
qqn  <=(not(RN and qq and Clr));

end Behavioral;