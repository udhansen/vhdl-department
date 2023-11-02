----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2021 11:16:25 AM
-- Design Name: 
-- Module Name: Shifter - Behavioral
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


          
entity Shifter is
    Port ( B : in STD_LOGIC_VECTOR (7 downto 0);
           H_Select : in STD_LOGIC_VECTOR (1 downto 0);
           H : out STD_LOGIC_VECTOR (7 downto 0));
end Shifter;

architecture Behavioral of Shifter is
component MUX3x1
    Port (X: in STD_LOGIC_VECTOR (2 downto 0);
      Sel: in STD_LOGIC_VECTOR (1 downto 0);
      Y: out STD_LOGIC);
end component;     
begin
Bit_0: MUX3x1 port map (Sel => H_Select, X(0)=>B(0), X(1)=>B(1), X(2)=>'0', Y=>H(0));

Bit_1_6_for: for i in 1 to 6 generate
    Bit_i: MUX3x1 port map (Sel => H_Select, X(0)=>B(i), X(1)=>B(i+1), X(2)=>B(i-1), Y=>H(i));
end generate Bit_1_6_for;

Bit_7: MUX3x1 port map (Sel => H_Select, X(0)=>B(7), X(1)=>'0', X(2)=>B(6), Y=>H(7));

end Behavioral;
--H(0) <= B(0) when H_Select = "00" else
--        B(1) when H_Select = "01" else
--        '0' when H_Select = "10" else
--        B(0) when H_Select = "11" else
--        'X';
--H(1) <= B(1) when H_Select = "00" else
--        B(2) when H_Select = "01" else
--        B(0) when H_Select = "10" else
--        B(1) when H_Select = "11" else
--        'X';
--H(2) <= B(2) when H_Select = "00" else
--        B(3) when H_Select = "01" else
--        B(1) when H_Select = "10" else
--        B(2) when H_Select = "11" else
--        'X';  
--H(3) <= B(3) when H_Select = "00" else
--        B(4) when H_Select = "01" else
--        B(2) when H_Select = "10" else
--        B(3) when H_Select = "11" else
--        'X';
--H(4) <= B(4) when H_Select = "00" else
--        B(5) when H_Select = "01" else
--        B(3) when H_Select = "10" else
--        B(4) when H_Select = "11" else
--        'X';
--H(5) <= B(5) when H_Select = "00" else
--        B(6) when H_Select = "01" else
--        B(4) when H_Select = "10" else
--        B(5) when H_Select = "11" else
--        'X';
--H(6) <= B(6) when H_Select = "00" else
--        B(7) when H_Select = "01" else
--        B(5) when H_Select = "10" else
--        B(6) when H_Select = "11" else
--        'X';
--H(7) <= B(7) when H_Select = "00" else
--        '0' when H_Select = "01" else
--        B(6) when H_Select = "10" else
--        B(7) when H_Select = "11" else
--        'X';  