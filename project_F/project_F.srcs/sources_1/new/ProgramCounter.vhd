
-- Module Name: ProgramCounter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgramCounter is
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Address_in : in STD_LOGIC_VECTOR (7 downto 0);
           PS : in STD_LOGIC_VECTOR (1 downto 0);
           Offset : in STD_LOGIC_VECTOR (7 downto 0);
           PC : out STD_LOGIC_VECTOR (7 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is

signal Address_old_sig: STD_LOGIC_VECTOR(7 downto 0) := "00000000"; 

begin

process(RESET, CLK)

begin

if Reset = '1' then 
    PC <= X"00";
    Address_old_sig <= X"00";
    elsif RISING_EDGE(CLK) then
    if PS = "00" then 
       PC <= Address_old_sig; -- Hold
    elsif PS = "01" then
       PC <= Address_old_sig + 1; -- Increment
       Address_old_sig <= Address_old_sig + 1;
    elsif PS = "10" then
       PC <= Address_old_sig + offset; -- Branch
       Address_old_sig <= Address_old_sig + offset;
    elsif PS = "11" then
       Address_old_sig <= Address_in;
       PC <= Address_in; -- Jump
    else
       PC <= Address_old_sig; -- Idle
    end if;
end if;

end process;

end Behavioral;