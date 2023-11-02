
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2021 11:16:25 AM
-- Design Name: 
-- Module Name: MUXF - Behavioral
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

entity MUXF is
    Port ( R : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (7 downto 0);
           MUX_Select : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));

end MUXF;

architecture Behavioral of MUXF is

begin
    muxf_GENERATE_FOR: for i in 0 to 7 generate
        Y(i) <= R(i) when (MUX_Select = '0') else S(i);

    end generate muxf_GENERATE_FOR;

--Y(0) <= R(0) when (MUX_Select = '0') else S(0);
--Y(1) <= R(1) when (MUX_Select = '0') else S(1); 
--Y(2) <= R(2) when (MUX_Select = '0') else S(2); 
--Y(3) <= R(3) when (MUX_Select = '0') else S(3); 
--Y(4) <= R(4) when (MUX_Select = '0') else S(4); 
--Y(5) <= R(5) when (MUX_Select = '0') else S(5); 
--Y(6) <= R(6) when (MUX_Select = '0') else S(6);
--Y(7) <= R(7) when (MUX_Select = '0') else S(7);  
end Behavioral;
