----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2021 04:33:35 PM
-- Design Name: 
-- Module Name: 7segdriver - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SevenSegDriver is
    Port ( Reset: in STD_LOGIC;
           CLK: in STD_LOGIC;
           Dword : in STD_LOGIC_VECTOR (15 downto 0);
           Anode: out STD_LOGIC_VECTOR(7 downto 0);
           Cathode : out STD_LOGIC_VECTOR (7 downto 0));
end SevenSegDriver;

architecture behavioral of SevenSegDriver is
signal DispCount: integer range 0 to 3;
signal DataN: STD_LOGIC_VECTOR (3 downto 0);

begin
	
	DispCountReg: process(Reset, CLK)
	begin
	 if Reset = '1' then
	 DispCount <= 0;
	 elsif RISING_EDGE(CLK) then
	   if DispCount = 3 then 
	       DispCount <= 0;
	   else 
		   DispCount <= DispCount + 1; 
	   end if;
     end if;
	end process DispCountReg;

	DispCountDec: process(DispCount, Dword)
	begin
	  case DispCount is
	    when 0 => 
		    Anode <= "11111110";        --  Display 1 activated
			DataN <= Dword(3 downto 0);
	    when 1 => 
		    Anode <= "11111101";        --  Display 2 activated
			DataN <= Dword(7 downto 4);
	    when 2 => 
		    Anode <= "11111011";        --  Display 3 activated
			DataN <= Dword(11 downto 8);
	    when others => 
		    Anode <= "11110111";        --  Display 4 activated
			DataN <= Dword(15 downto 12);
     end case;
    end process DispCountDec;

   with DataN Select      --  Activate segments acc. to Data
     Cathode <= "11000000" when "0000",   --0
                "11111001" when "0001",   --1
                "10100100" when "0010",   --2
                "10110000" when "0011",   --3
                "10011001" when "0100",   --4
                "10010010" when "0101",   --5
                "10000010" when "0110",   --6
                "11111000" when "0111",   --7
                "10000000" when "1000",   --8
                "10011000" when "1001",   --9
                "10001000" when "1010",   --A
                "10000011" when "1011",   --b
                "11000110" when "1100",   --C
                "10100001" when "1101",   --d
                "10000110" when "1110",   --E
                "10001110" when "1111",   --F
                "11111111" when others;  --blank

end Behavioral;
