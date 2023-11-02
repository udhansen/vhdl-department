library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity En_32_to_1 is
    Port ( R : in STD_LOGIC_VECTOR (15 downto 0);
           E : in STD_LOGIC_VECTOR (15 downto 0);
           R_Out : out STD_LOGIC);
end En_32_to_1;

architecture Behavioral of En_32_to_1 is

begin

R_Out <= (R(0) and E(0)) or (R(1) and E(1)) or (R(2) and E(2)) or (R(3) and E(3)) 
or (R(4) and E(4)) or (R(5) and E(5)) or (R(6) and E(6)) or (R(7) and E(7)) or (R(8) and E(8))
or (R(9) and E(9)) or (R(10) and E(10)) or (R(11) and E(11)) or (R(12) and E(12)) or (R(13) and E(13))
or (R(14) and E(14)) or (R(15) and E(15));

end Behavioral;
