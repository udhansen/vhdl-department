
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2021 10:29:38 AM
-- Design Name: 
-- Module Name: SignExtender - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SignExtender is
    Port ( IR : in STD_LOGIC_VECTOR (15 downto 0);
           Extended_8 : out STD_LOGIC_VECTOR (7 downto 0));
end SignExtender;

architecture Behavioral of SignExtender is
 
begin

Extended_8 <= "111" & IR(7) & IR(6) & IR(2) & IR(1) & IR(0) when IR(8) = '1' else "000" & IR(7) & IR(6) & IR(2) & IR(1) & IR(0);

end Behavioral;
