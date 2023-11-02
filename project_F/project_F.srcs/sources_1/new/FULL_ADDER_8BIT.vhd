----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2021 11:47:16 AM
-- Design Name: 
-- Module Name: FULL_ADDER_8bit - Behavioral
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

entity FULL_ADDER_8bit is
    Port ( X : in STD_LOGIC;
           Y : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           G : out STD_LOGIC);
end FULL_ADDER_8bit;

architecture Behavioral of FULL_ADDER_8bit is

begin

G <= Cin XOR (X XOR Y);
Cout <= (X AND Y) OR ((X XOR Y) AND Cin);

end Behavioral;