----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2021 10:33:50 AM
-- Design Name: 
-- Module Name: ZeroFiller - Behavioral
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

entity ZeroFiller is
    Port ( IR : in STD_LOGIC_VECTOR (15 downto 0);
           ZeroFilled_8 : out STD_LOGIC_VECTOR (7 downto 0));
end ZeroFiller;

architecture Behavioral of ZeroFiller is

begin

ZeroFilled_8 <= "00000" & IR(2) & IR(1) & IR(0);

end Behavioral;