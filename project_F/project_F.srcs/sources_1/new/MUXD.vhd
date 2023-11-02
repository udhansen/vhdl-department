----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2021 10:17:46 AM
-- Design Name: 
-- Module Name: MUXD - Behavioral
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

entity MUXD is
    Port ( DataIn : in STD_LOGIC_VECTOR (7 downto 0);
           Y : in STD_LOGIC_VECTOR (7 downto 0);
           MD : in STD_LOGIC;
           YY : out STD_LOGIC_VECTOR (7 downto 0));
end MUXD;

architecture Behavioral of MUXD is

begin
    muxd_GENERATE_FOR: for i in 0 to 7 generate
        YY(i) <= DataIn(i) when (MD = '0') else Y(i);
    end generate muxd_GENERATE_FOR;
--YY(0) <= DataIn(0) when (MD = '0') else Y(0);
--YY(1) <= DataIn(1) when (MD = '0') else Y(1);
--YY(2) <= DataIn(2) when (MD = '0') else Y(2); 
--YY(3) <= DataIn(3) when (MD = '0') else Y(3); 
--YY(4) <= DataIn(4) when (MD = '0') else Y(4); 
--YY(5) <= DataIn(5) when (MD = '0') else Y(5); 
--YY(6) <= DataIn(6) when (MD = '0') else Y(6);
--YY(7) <= DataIn(7) when (MD = '0') else Y(7); 

end Behavioral;
