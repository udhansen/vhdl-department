----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2021 10:34:39 AM
-- Design Name: 
-- Module Name: Zero Filler2 - Behavioral
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

entity ZeroFiller2 is
    Port ( Data_Out : in STD_LOGIC_VECTOR (7 downto 0);
           Data_in : out STD_LOGIC_VECTOR (15 downto 0));
end ZeroFiller2;

architecture Behavioral of ZeroFiller2 is

begin
Data_In <= "00000000" & Data_Out(7 downto 0);

end Behavioral;
