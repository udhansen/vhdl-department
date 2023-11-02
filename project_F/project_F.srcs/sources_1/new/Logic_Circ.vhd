----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2021 11:48:37 AM
-- Design Name: 
-- Module Name: Logic_Circ - Behavioral
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

entity Logic_Circ is
   Port (Ai, Bi: in STD_LOGIC_VECTOR(7 downto 0);
          Sel: in STD_LOGIC_VECTOR(1 downto 0);
          G: out STD_LOGIC_VECTOR(7 downto 0));
end Logic_Circ;

architecture Behavioral of Logic_Circ is

begin

G <= (Ai or Bi) when (Sel = "00") else
     (Ai and Bi) when (Sel = "01") else 
     (Ai XOR Bi) when (Sel = "10") else 
     (not Ai) when (Sel = "11");

end Behavioral;
