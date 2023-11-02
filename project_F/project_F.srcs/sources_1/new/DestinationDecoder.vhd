
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DestinationDecoder is
   port(
     write: in std_logic;
     DA   : in std_logic_vector(3 downto 0);
     Load : out std_logic_vector(15 downto 0));
end DestinationDecoder;

architecture Behavioral of DestinationDecoder is

begin

load(0) <= write and ((not DA(0)) and (not DA(1))) and ((not DA(2)) and (not DA(3)));
load(1) <= write and (DA(0) and (not DA(1))) and ((not DA(2)) and (not DA(3)));
load(2) <= write and ((not DA(0)) and DA(1)) and ((not DA(2)) and (not DA(3)));
load(3) <= write and (DA(0) and DA(1)) and ((not DA(2)) and (not DA(3)));
load(4) <= write and ((not DA(0)) and (not DA(1))) and (DA(2) and (not DA(3)));
load(5) <= write and (DA(0) and (not DA(1))) and (DA(2) and (not DA(3)));
load(6) <= write and ((not DA(0)) and DA(1)) and (DA(2) and (not DA(3)));
load(7) <= write and (DA(0) and DA(1)) and (DA(2) and (not DA(3)));
load(8) <= write and ((not DA(0)) and (not DA(1))) and ((not DA(2)) and DA(3));
load(9) <= write and (DA(0) and (not DA(1))) and ((not DA(2)) and DA(3));
load(10) <= write and ((not DA(0)) and DA(1)) and ((not DA(2)) and DA(3));
load(11) <= write and (DA(0) and DA(1)) and ((not DA(2)) and DA(3));
load(12) <= write and ((not DA(0)) and (not DA(1))) and (DA(2) and DA(3));
load(13) <= write and (DA(0) and (not DA(1))) and (DA(2) and DA(3));
load(14) <= write and ((not DA(0)) and DA(1)) and (DA(2) and DA(3));
load(15) <= write and (DA(0) and DA(1)) and (DA(2) and DA(3));

end Behavioral;
