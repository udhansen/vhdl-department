
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2021 10:32:06 AM
-- Design Name: 
-- Module Name: InstructionRegister - Behavioral
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

entity InstructionRegister is
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Instruction_In : in STD_LOGIC_VECTOR (15 downto 0);
           IL : in STD_LOGIC;
           IR : out STD_LOGIC_VECTOR (15 downto 0));
end InstructionRegister;

architecture Behavioral of InstructionRegister is

signal IR_old_sig: STD_LOGIC_VECTOR(15 downto 0) := X"0000";

begin
 
process(RESET, CLK)

begin

if Reset = '1' then 
    IR <= X"0000";
    IR_old_sig <= X"0000";
    elsif RISING_EDGE(CLK) then
    if IL = '0' then 
       IR <= IR_old_sig; -- No load
    elsif IL <= '1' then
       IR_old_sig <= Instruction_In;
       IR <= Instruction_In; -- Load
    else
       IR <= IR_old_sig; -- Idle
    end if;
end if;

end process;

end Behavioral;

