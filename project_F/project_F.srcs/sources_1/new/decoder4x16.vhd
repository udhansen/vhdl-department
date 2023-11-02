library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder4x16 is
    Port ( 
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           S3 : in STD_LOGIC;
           E : out STD_LOGIC_VECTOR (15 downto 0));
           
end decoder4x16;

architecture Behavioral of decoder4x16 is

begin

E(0) <= ((not S0) and (not S1)) and ((not S2) and (not S3));
E(1) <= (S0 and (not S1)) and ((not S2) and (not S3));
E(2) <= ((not S0) and S1) and ((not S2) and (not S3));
E(3) <= (S0 and S1) and ((not S2) and (not S3));
E(4) <= ((not S0) and (not S1)) and (S2 and (not S3));
E(5) <= (S0 and (not S1)) and (S2 and (not S3));
E(6) <= ((not S0) and S1) and (S2 and (not S3));
E(7) <= (S0 and S1) and (S2 and (not S3));
E(8) <= ((not S0) and (not S1)) and ((not S2) and S3);
E(9) <= (S0 and (not S1)) and ((not S2) and S3);
E(10) <= ((not S0) and S1) and ((not S2) and S3);
E(11) <= (S0 and S1) and ((not S2) and S3);
E(12) <= ((not S0) and (not S1)) and (S2 and S3);
E(13) <= (S0 and (not S1)) and (S2 and S3);
E(14) <= ((not S0) and S1) and (S2 and S3);
E(15) <= (S0 and S1) and (S2 and S3);

end Behavioral;