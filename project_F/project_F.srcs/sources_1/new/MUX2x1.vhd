

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX2x1 is
    Port ( S : in STD_LOGIC;
           Ai : in STD_LOGIC;
           Bi : in STD_LOGIC;
           Go : out STD_LOGIC);
end MUX2x1;

architecture Behavioral of MUX2x1 is

begin

Go <= ((Ai)and(S)) or ((Bi)and(not S));

end Behavioral;