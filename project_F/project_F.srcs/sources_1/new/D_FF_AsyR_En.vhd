


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity D_FF_AsyR_En is
    Port ( En : in STD_LOGIC;
           Reset : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC;
           QN : out STD_LOGIC);
end D_FF_AsyR_En;

architecture Behavioral of D_FF_AsyR_En is
signal qq,dd: std_logic; 

begin

process(C, Reset, En) is
begin
    if Reset = '1' then
        Q <= '0';
    elsif RISING_EDGE(C) then
        if En = '1' then 
            Q <= D;
        end if;
    end if;
end process;    


--Q <= qq; 
--dd<=( (qq and(not En)) or (En and D));

--U1: entity work.D_FF_AsyR
--port map (clr=>Reset, D=>dd, C=>C, Q => qq);

end Behavioral;


