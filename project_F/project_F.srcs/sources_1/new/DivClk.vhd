
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DivClk is
    port ( Reset: in STD_LOGIC;     
           Clk: in STD_LOGIC;     
           TimeP: in integer;     
           Clk1: out STD_LOGIC);   
end DivClk;

architecture DivClk_arch of DivClk is

signal Cnt1: integer range 0 to 25000000;  
signal Clear1: STD_LOGIC;  
signal Clk1_D: STD_LOGIC;  

begin

  Div1Reg: process(clk,Reset)
  begin
    if Reset = '1' then Clk1_D <= '0';     
    elsif RISING_EDGE(CLK) then
      if Clear1= '1' then                
        Clk1_D <= not Clk1_D;
		end if;
    end if;
  end process Div1Reg;

  Div1Dec: process(Cnt1, TimeP) 
  begin
    Clear1 <= '0';
    if Cnt1 = TimeP/2 then
	   Clear1 <= '1';
	 end if;
  end process Div1Dec;

  Div1Cnt:process(clk,Reset)
  begin
    if Reset = '1' then Cnt1 <= 1;        
    elsif RISING_EDGE(CLK) then
	   if Clear1 = '1' then Cnt1 <= 1;  
		else Cnt1 <= Cnt1 + 1; end if;
    end if;
  end process Div1Cnt;

  Clk1 <= Clk1_D;

end DivClk_arch;