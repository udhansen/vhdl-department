
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUXM is
    Port ( S : in STD_LOGIC;
           Ai : in STD_LOGIC_VECTOR (7 downto 0);
           Bi : in STD_LOGIC_VECTOR (7 downto 0);
           Go : out STD_LOGIC_VECTOR (7 downto 0));
end MUXM;

architecture Behavioral of MUXM is

component MUX2x1 is
    Port ( S : in STD_LOGIC;
           Ai : in STD_LOGIC;
           Bi : in STD_LOGIC;
           Go : out STD_LOGIC);
end component;

begin

U0: MUX2x1 port map(S=>S, Ai=>Ai(0) ,Bi=>Bi(0),Go=>Go(0));
U1: MUX2x1 port map(S=>S, Ai=>Ai(1) ,Bi=>Bi(1),Go=>Go(1));
U2: MUX2x1 port map(S=>S, Ai=>Ai(2) ,Bi=>Bi(2),Go=>Go(2));
U3: MUX2x1 port map(S=>S, Ai=>Ai(3) ,Bi=>Bi(3),Go=>Go(3));
U4: MUX2x1 port map(S=>S, Ai=>Ai(4) ,Bi=>Bi(4),Go=>Go(4));
U5: MUX2x1 port map(S=>S, Ai=>Ai(5) ,Bi=>Bi(5),Go=>Go(5));
U6: MUX2x1 port map(S=>S, Ai=>Ai(6) ,Bi=>Bi(6),Go=>Go(6));
U7: MUX2x1 port map(S=>S, Ai=>Ai(7) ,Bi=>Bi(7),Go=>Go(7));

end Behavioral;