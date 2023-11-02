----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:45:44 08/05/2020 
-- Design Name: 
-- Module Name:    SpiReg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SpiReg is
    Port ( SCK : in  STD_LOGIC;
           MOSI : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           SS : in  STD_LOGIC;
           Shape : out  STD_LOGIC;
           Ampl : out  STD_LOGIC;
           Freq : out  STD_LOGIC;
           SigEN : out  STD_LOGIC;
           Clk : in  STD_LOGIC);
end SpiReg;

architecture Behavioral of SpiReg is

begin


end Behavioral;

