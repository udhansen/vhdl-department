----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2021 11:49:33 AM
-- Design Name: 
-- Module Name: MUX_2_1 - Behavioral
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

entity MUX_2_1 is
    Port ( X : in STD_LOGIC_VECTOR (7 downto 0);
           Y : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (7 downto 0));
end MUX_2_1;

architecture Behavioral of MUX_2_1 is

begin

G <= X when (S = '0') else Y;

end Behavioral;
