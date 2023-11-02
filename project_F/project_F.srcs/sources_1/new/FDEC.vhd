
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2021 11:02:16 AM
-- Design Name: 
-- Module Name: FDEC - Behavioral
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

entity FDEC is
    Port ( FS3 : in STD_LOGIC;
           FS2 : in STD_LOGIC;
           FS1 : in STD_LOGIC;
           FS0 : in STD_LOGIC;
           J_Select : out STD_LOGIC_VECTOR (3 downto 0);
           H_Select : out STD_LOGIC_VECTOR (1 downto 0);
           MF : out STD_LOGIC);
end FDEC;

architecture Behavioral of FDEC is

signal MFsig: STD_LOGIC; 

begin

J_Select(3) <= FS3;
J_Select(2) <= FS2;
J_Select(1) <= FS1;
J_Select(0) <= FS0;

MF <= FS3 and FS2;

H_Select(1) <= FS1;
H_Select(0) <= FS0;

end Behavioral;