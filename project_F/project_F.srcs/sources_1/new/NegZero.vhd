
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2021 11:16:25 AM
-- Design Name: 
-- Module Name: NegZero - Behavioral
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

entity NegZero is
    Port ( MUXF : in STD_LOGIC_VECTOR (7 downto 0);
           N : out STD_LOGIC;
           Z : out STD_LOGIC);
end NegZero;

architecture Behavioral of NegZero is

begin
-- Input fra MUXF
    N <= MUXF(7); -- to determine sign
    Z <= '1' when MUXF ="00000000" else '0';
    
--    neg_GENERATE_FOR: for i in 0 to 6 generate
--        Z <= not (MUXF(i) or MUXF(i+1));
--    end generate neg_GENERATE_FOR;
   -- Z <= not (MUXF(0) or MUXF(1) or MUXF(2) or MUXF(3) or MUXF(4) or MUXF(5) or MUXF(6) or MUXF(7)); -- 1 if all is 0

end Behavioral;
