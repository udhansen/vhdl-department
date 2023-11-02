
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2021 09:53:26 AM
-- Design Name: 
-- Module Name: InstructionDecoder - Behavioral
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

entity InstructionDecoder is
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           IR : in STD_LOGIC_VECTOR (15 downto 0);
           V,C,N,Z : in STD_LOGIC;
           PS : out STD_LOGIC_VECTOR (1 downto 0);
           IL : out STD_LOGIC;
           DX,AX,BX,FS : out STD_LOGIC_VECTOR (3 downto 0);
           MB,MD,RW,MM,MW : out STD_LOGIC);
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is

type StateType is (EX0, EX1, EX2, EX3, EX4, INF);
signal State, NS : StateType;

begin

StateReg: process (RESET,CLK)
begin
    if RESET = '1' then State <= INF;
    elsif RISING_EDGE(CLK) then
        State <= NS;
    end if;
end process;

      -- Inputs -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
      
NS <= EX0 when State = INF else
      INF when State = EX0 and IR(15 downto 9) = "0000000" else
      INF when State = EX0 and IR(15 downto 9) = "0000001" else
      INF when State = EX0 and IR(15 downto 9) = "0000010" else
      INF when State = EX0 and IR(15 downto 9) = "0000101" else
      INF when State = EX0 and IR(15 downto 9) = "0000110" else
      INF when State = EX0 and IR(15 downto 9) = "0001000" else
      INF when State = EX0 and IR(15 downto 9) = "0001001" else
      INF when State = EX0 and IR(15 downto 9) = "0001010" else
      INF when State = EX0 and IR(15 downto 9) = "0001011" else
      INF when State = EX0 and IR(15 downto 9) = "0001100" else
      INF when State = EX0 and IR(15 downto 9) = "0010000" else
      INF when State = EX0 and IR(15 downto 9) = "0100000" else
      INF when State = EX0 and IR(15 downto 9) = "1001100" else
      INF when State = EX0 and IR(15 downto 9) = "1000010" else
      INF when State = EX0 and IR(15 downto 9) = "1100000" and Z = '1' else
      INF when State = EX0 and IR(15 downto 9) = "1100000" and Z = '0' else
      INF when State = EX0 and IR(15 downto 9) = "1100001" and N = '1' else
      INF when State = EX0 and IR(15 downto 9) = "1100001" and N = '0' else
      INF when State = EX0 and IR(15 downto 9) = "1110000" else
      
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
      
      EX1 when State = EX0 and IR(15 downto 9) = "0010001" else
      INF when State = EX1 and IR(15 downto 9) = "0010001" else
      
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
      
      EX1 when State = EX0 and IR(15 downto 9) = "0001101" and Z = '0' else
      INF when State = EX0 and IR(15 downto 9) = "0001101" and Z = '1' else
      EX2 when State = EX1 and IR(15 downto 9) = "0001101" and Z = '0' else
      INF when State = EX1 and IR(15 downto 9) = "0001101" and Z = '1' else
      EX3 when State = EX2 and IR(15 downto 9) = "0001101" else
      EX2 when State = EX3 and IR(15 downto 9) = "0001101" and Z = '0' else
      EX4 when State = EX3 and IR(15 downto 9) = "0001101" and Z = '1' else
      INF when State = EX4 and IR(15 downto 9) = "0001101" else
      
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
      
      EX1 when State = EX0 and IR(15 downto 9) = "0001110" and Z = '0' else
      INF when State = EX0 and IR(15 downto 9) = "0001110" and Z = '1' else
      EX2 when State = EX1 and IR(15 downto 9) = "0001110" and Z = '0' else
      INF when State = EX1 and IR(15 downto 9) = "0001110" and Z = '1' else
      EX3 when State = EX2 and IR(15 downto 9) = "0001110" else
      EX2 when State = EX3 and IR(15 downto 9) = "0001110" and Z = '0' else
      EX4 when State = EX3 and IR(15 downto 9) = "0001110" and Z = '1' else
      INF when State = EX4 and IR(15 downto 9) = "0001110" else
      INF;
      
      -- Outputs -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

IL <= '1' when State = INF else
      '0';
      
      -- New Table Column -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
      
PS <= "00" when State = INF else
      "01" when State = EX0 and IR(15 downto 9) = "0000000" else
      "01" when State = EX0 and IR(15 downto 9) = "0000001" else
      "01" when State = EX0 and IR(15 downto 9) = "0000010" else
      "01" when State = EX0 and IR(15 downto 9) = "0000101" else
      "01" when State = EX0 and IR(15 downto 9) = "0000110" else
      "01" when State = EX0 and IR(15 downto 9) = "0001000" else
      "01" when State = EX0 and IR(15 downto 9) = "0001001" else
      "01" when State = EX0 and IR(15 downto 9) = "0001010" else
      "01" when State = EX0 and IR(15 downto 9) = "0001011" else
      "01" when State = EX0 and IR(15 downto 9) = "0001100" else
      "01" when State = EX0 and IR(15 downto 9) = "0010000" else
      "01" when State = EX0 and IR(15 downto 9) = "0100000" else
      "01" when State = EX0 and IR(15 downto 9) = "1001100" else
      "01" when State = EX0 and IR(15 downto 9) = "1000010" else
      "10" when State = EX0 and IR(15 downto 9) = "1100000" and Z = '1' else
      "01" when State = EX0 and IR(15 downto 9) = "1100000" and Z = '0' else
      "10" when State = EX0 and IR(15 downto 9) = "1100001" and N = '1' else
      "01" when State = EX0 and IR(15 downto 9) = "1100001" and N = '0' else
      "11" when State = EX0 and IR(15 downto 9) = "1110000" else 
      
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
      
      "00" when State = EX0 and IR(15 downto 9) = "0010001" else
      "01" when State = EX1 and IR(15 downto 9) = "0010001" else      
      
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
      
      "00" when State = EX0 and IR(15 downto 9) = "0001101" and Z = '0' else
      "01" when State = EX0 and IR(15 downto 9) = "0001101" and Z = '1' else
      "00" when State = EX1 and IR(15 downto 9) = "0001101" and Z = '0' else
      "01" when State = EX1 and IR(15 downto 9) = "0001101" and Z = '1' else
      "00" when State = EX2 and IR(15 downto 9) = "0001101" else
      "00" when State = EX3 and IR(15 downto 9) = "0001101" and Z = '0' else
      "00" when State = EX3 and IR(15 downto 9) = "0001101" and Z = '1' else
      "01" when State = EX4 and IR(15 downto 9) = "0001101" else
      
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
      
      "00" when State = EX0 and IR(15 downto 9) = "0001110" and Z = '0' else
      "01" when State = EX0 and IR(15 downto 9) = "0001110" and Z = '1' else
      "00" when State = EX1 and IR(15 downto 9) = "0001110" and Z = '0' else
      "01" when State = EX1 and IR(15 downto 9) = "0001110" and Z = '1' else
      "00" when State = EX2 and IR(15 downto 9) = "0001110" else
      "00" when State = EX3 and IR(15 downto 9) = "0001110" and Z = '0' else
      "00" when State = EX3 and IR(15 downto 9) = "0001110" and Z = '1' else
      "01" when State = EX4 and IR(15 downto 9) = "0001110" else
      "00";     

      -- New Table Column -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
      
DX <= '0' & IR(8 downto 6) when State = INF else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "0000000" else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "0000001" else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "0000010" else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "0000101" else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "0000110" else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "0001000" else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "0001001" else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "0001010" else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "0001011" else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "0001100" else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "0010000" else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "0100000" else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "1001100" else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "1000010" else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "1100000" and Z = '1' else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "1100000" and Z = '0' else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "1100001" and N = '1' else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "1100001" and N = '0' else
      '0' & IR(8 downto 6) when State = EX0 and IR(15 downto 9) = "1110000" else
      
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

                    "1000" when State = EX0 and IR(15 downto 9) = "0010001" else
      '0' & IR(8 downto 6) when State = EX1 and IR(15 downto 9) = "0010001" else
      
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
      
                    "1000" when State = EX0 and IR(15 downto 9) = "0001101" and Z = '0' else
                    "1000" when State = EX0 and IR(15 downto 9) = "0001101" and Z = '1' else
                    "1001" when State = EX1 and IR(15 downto 9) = "0001101" and Z = '0' else
                    "1001" when State = EX1 and IR(15 downto 9) = "0001101" and Z = '1' else
                    "1000" when State = EX2 and IR(15 downto 9) = "0001101" else
                    "1001" when State = EX3 and IR(15 downto 9) = "0001101" and Z = '0' else
                    "1001" when State = EX3 and IR(15 downto 9) = "0001101" and Z = '1' else
      '0' & IR(8 downto 6) when State = EX4 and IR(15 downto 9) = "0001101" else
      
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
      
                    "1000" when State = EX0 and IR(15 downto 9) = "0001110" and Z = '0' else
                    "1000" when State = EX0 and IR(15 downto 9) = "0001110" and Z = '1' else
                    "1001" when State = EX1 and IR(15 downto 9) = "0001110" and Z = '0' else
                    "1001" when State = EX1 and IR(15 downto 9) = "0001110" and Z = '1' else
                    "1000" when State = EX2 and IR(15 downto 9) = "0001110" else
                    "1001" when State = EX3 and IR(15 downto 9) = "0001110" and Z = '0' else
                    "1001" when State = EX3 and IR(15 downto 9) = "0001110" and Z = '1' else
      '0' & IR(8 downto 6) when State = EX4 and IR(15 downto 9) = "0001110" else
      '0' & IR(8 downto 6);
      
      -- New Table Column -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

AX <=       '0' & IR(5 downto 3) when State = INF else                                            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0000000" else            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0000001" else            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0000010" else            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0000101" else            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0000110" else            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0001000" else            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0001001" else            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0001010" else            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0001011" else            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0001100" else            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0010000" else            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0100000" else            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "1001100" else            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "1000010" else            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "1100000" and Z = '1' else
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "1100000" and Z = '0' else
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "1100001" and N = '1' else
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "1100001" and N = '0' else
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "1110000" else   
                     
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --    
                                                                           
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0010001" else
                          "1000" when State = EX1 and IR(15 downto 9) = "0010001" else
                          
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0001101" and Z = '0' else
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0001101" and Z = '1' else
            '0' & IR(5 downto 3) when State = EX1 and IR(15 downto 9) = "0001101" and Z = '0' else
            '0' & IR(5 downto 3) when State = EX1 and IR(15 downto 9) = "0001101" and Z = '1' else
            '0' & IR(5 downto 3) when State = EX2 and IR(15 downto 9) = "0001101" else
                          "1001" when State = EX3 and IR(15 downto 9) = "0001101" and Z = '0' else
                          "1001" when State = EX3 and IR(15 downto 9) = "0001101" and Z = '1' else
                          "1000" when State = EX4 and IR(15 downto 9) = "0001101" else
                          
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0001110" and Z = '0' else
            '0' & IR(5 downto 3) when State = EX0 and IR(15 downto 9) = "0001110" and Z = '1' else
            '0' & IR(5 downto 3) when State = EX1 and IR(15 downto 9) = "0001110" and Z = '0' else
            '0' & IR(5 downto 3) when State = EX1 and IR(15 downto 9) = "0001110" and Z = '1' else
            '0' & IR(5 downto 3) when State = EX2 and IR(15 downto 9) = "0001110" else
                          "1001" when State = EX3 and IR(15 downto 9) = "0001110" and Z = '0' else
                          "1001" when State = EX3 and IR(15 downto 9) = "0001110" and Z = '1' else
                          "1000" when State = EX4 and IR(15 downto 9) = "0001110" else
            '0' & IR(5 downto 3);
            
      -- New Table Column -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

BX <=       '0' & IR(2 downto 0) when State = INF else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0000000" else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0000001" else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0000010" else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0000101" else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0000110" else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0001000" else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0001001" else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0001010" else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0001011" else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0001100" else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0010000" else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0100000" else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "1001100" else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "1000010" else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "1100000" and Z = '1' else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "1100000" and Z = '0' else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "1100001" and N = '1' else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "1100001" and N = '0' else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "1110000" else
            
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0010001" else
            '0' & IR(2 downto 0) when State = EX1 and IR(15 downto 9) = "0010001" else
            
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0001101" and Z = '0' else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0001101" and Z = '1' else
            '0' & IR(2 downto 0) when State = EX1 and IR(15 downto 9) = "0001101" and Z = '0' else
            '0' & IR(2 downto 0) when State = EX1 and IR(15 downto 9) = "0001101" and Z = '1' else
                          "1000" when State = EX2 and IR(15 downto 9) = "0001101" else
            '0' & IR(2 downto 0) when State = EX3 and IR(15 downto 9) = "0001101" and Z = '0' else
            '0' & IR(2 downto 0) when State = EX3 and IR(15 downto 9) = "0001101" and Z = '1' else
            '0' & IR(2 downto 0) when State = EX4 and IR(15 downto 9) = "0001101" else
            
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0001110" and Z = '0' else
            '0' & IR(2 downto 0) when State = EX0 and IR(15 downto 9) = "0001110" and Z = '1' else
            '0' & IR(2 downto 0) when State = EX1 and IR(15 downto 9) = "0001110" and Z = '0' else
            '0' & IR(2 downto 0) when State = EX1 and IR(15 downto 9) = "0001110" and Z = '1' else
                          "1000" when State = EX2 and IR(15 downto 9) = "0001110" else
            '0' & IR(2 downto 0) when State = EX3 and IR(15 downto 9) = "0001110" and Z = '0' else
            '0' & IR(2 downto 0) when State = EX3 and IR(15 downto 9) = "0001110" and Z = '1' else
            '0' & IR(2 downto 0) when State = EX4 and IR(15 downto 9) = "0001110" else
            '0' & IR(2 downto 0);
            
      -- New Table Column -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

MB <=       '0' when State = INF else
            '0' when State = EX0 and IR(15 downto 9) = "0000000" else
            '0' when State = EX0 and IR(15 downto 9) = "0000001" else
            '0' when State = EX0 and IR(15 downto 9) = "0000010" else
            '0' when State = EX0 and IR(15 downto 9) = "0000101" else
            '0' when State = EX0 and IR(15 downto 9) = "0000110" else
            '0' when State = EX0 and IR(15 downto 9) = "0001000" else
            '0' when State = EX0 and IR(15 downto 9) = "0001001" else
            '0' when State = EX0 and IR(15 downto 9) = "0001010" else
            '0' when State = EX0 and IR(15 downto 9) = "0001011" else
            '0' when State = EX0 and IR(15 downto 9) = "0001100" else
            '0' when State = EX0 and IR(15 downto 9) = "0010000" else
            '0' when State = EX0 and IR(15 downto 9) = "0100000" else
            '1' when State = EX0 and IR(15 downto 9) = "1001100" else
            '1' when State = EX0 and IR(15 downto 9) = "1000010" else
            '0' when State = EX0 and IR(15 downto 9) = "1100000" and Z = '1' else
            '0' when State = EX0 and IR(15 downto 9) = "1100000" and Z = '0' else
            '0' when State = EX0 and IR(15 downto 9) = "1100001" and N = '1' else
            '0' when State = EX0 and IR(15 downto 9) = "1100001" and N = '0' else
            '0' when State = EX0 and IR(15 downto 9) = "1110000" else
            
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            '0' when State = EX0 and IR(15 downto 9) = "0010001" else
            '0' when State = EX1 and IR(15 downto 9) = "0010001" else
            
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            '0' when State = EX0 and IR(15 downto 9) = "0001101" and Z = '0' else
            '0' when State = EX0 and IR(15 downto 9) = "0001101" and Z = '1' else
            '1' when State = EX1 and IR(15 downto 9) = "0001101" and Z = '0' else
            '1' when State = EX1 and IR(15 downto 9) = "0001101" and Z = '1' else
            '0' when State = EX2 and IR(15 downto 9) = "0001101" else
            '0' when State = EX3 and IR(15 downto 9) = "0001101" and Z = '0' else
            '0' when State = EX3 and IR(15 downto 9) = "0001101" and Z = '1' else
            '0' when State = EX4 and IR(15 downto 9) = "0001101" else
            
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            '0' when State = EX0 and IR(15 downto 9) = "0001110" and Z = '0' else
            '0' when State = EX0 and IR(15 downto 9) = "0001110" and Z = '1' else
            '1' when State = EX1 and IR(15 downto 9) = "0001110" and Z = '0' else
            '1' when State = EX1 and IR(15 downto 9) = "0001110" and Z = '1' else
            '0' when State = EX2 and IR(15 downto 9) = "0001110" else
            '0' when State = EX3 and IR(15 downto 9) = "0001110" and Z = '0' else
            '0' when State = EX3 and IR(15 downto 9) = "0001110" and Z = '1' else
            '0' when State = EX4 and IR(15 downto 9) = "0001110" else
            '0';
            
      -- New Table Column -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

FS <=       "0000" when State = INF else
            "0000" when State = EX0 and IR(15 downto 9) = "0000000" else
            "0001" when State = EX0 and IR(15 downto 9) = "0000001" else
            "0010" when State = EX0 and IR(15 downto 9) = "0000010" else
            "0101" when State = EX0 and IR(15 downto 9) = "0000101" else
            "0110" when State = EX0 and IR(15 downto 9) = "0000110" else
            "1000" when State = EX0 and IR(15 downto 9) = "0001000" else
            "1001" when State = EX0 and IR(15 downto 9) = "0001001" else
            "1010" when State = EX0 and IR(15 downto 9) = "0001010" else
            "1011" when State = EX0 and IR(15 downto 9) = "0001011" else
            "1100" when State = EX0 and IR(15 downto 9) = "0001100" else
            "0000" when State = EX0 and IR(15 downto 9) = "0010000" else
            "0000" when State = EX0 and IR(15 downto 9) = "0100000" else
            "1100" when State = EX0 and IR(15 downto 9) = "1001100" else
            "0010" when State = EX0 and IR(15 downto 9) = "1000010" else
            "0000" when State = EX0 and IR(15 downto 9) = "1100000" and Z = '1' else
            "0000" when State = EX0 and IR(15 downto 9) = "1100000" and Z = '0' else
            "0000" when State = EX0 and IR(15 downto 9) = "1100001" and N = '1' else
            "0000" when State = EX0 and IR(15 downto 9) = "1100001" and N = '0' else
            "0000" when State = EX0 and IR(15 downto 9) = "1110000" else
            
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            "0000" when State = EX0 and IR(15 downto 9) = "0010001" else
            "0000" when State = EX1 and IR(15 downto 9) = "0010001" else
            
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            "0000" when State = EX0 and IR(15 downto 9) = "0001101" and Z = '0' else
            "0000" when State = EX0 and IR(15 downto 9) = "0001101" and Z = '1' else
            "1100" when State = EX1 and IR(15 downto 9) = "0001101" and Z = '0' else
            "1100" when State = EX1 and IR(15 downto 9) = "0001101" and Z = '1' else
            "1101" when State = EX2 and IR(15 downto 9) = "0001101" else
            "0110" when State = EX3 and IR(15 downto 9) = "0001101" and Z = '0' else
            "0110" when State = EX3 and IR(15 downto 9) = "0001101" and Z = '1' else
            "0000" when State = EX4 and IR(15 downto 9) = "0001101" else
            
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            "0000" when State = EX0 and IR(15 downto 9) = "0001110" and Z = '0' else
            "0000" when State = EX0 and IR(15 downto 9) = "0001110" and Z = '1' else
            "1100" when State = EX1 and IR(15 downto 9) = "0001110" and Z = '0' else
            "1100" when State = EX1 and IR(15 downto 9) = "0001110" and Z = '1' else
            "1110" when State = EX2 and IR(15 downto 9) = "0001110" else
            "0110" when State = EX3 and IR(15 downto 9) = "0001110" and Z = '0' else
            "0110" when State = EX3 and IR(15 downto 9) = "0001110" and Z = '1' else
            "0000" when State = EX4 and IR(15 downto 9) = "0001110" else
            "0000";
            
      -- New Table Column -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

MD <=       '0' when State = INF else
            '0' when State = EX0 and IR(15 downto 9) = "0000000" else
            '0' when State = EX0 and IR(15 downto 9) = "0000001" else
            '0' when State = EX0 and IR(15 downto 9) = "0000010" else
            '0' when State = EX0 and IR(15 downto 9) = "0000101" else
            '0' when State = EX0 and IR(15 downto 9) = "0000110" else
            '0' when State = EX0 and IR(15 downto 9) = "0001000" else
            '0' when State = EX0 and IR(15 downto 9) = "0001001" else
            '0' when State = EX0 and IR(15 downto 9) = "0001010" else
            '0' when State = EX0 and IR(15 downto 9) = "0001011" else
            '0' when State = EX0 and IR(15 downto 9) = "0001100" else
            '1' when State = EX0 and IR(15 downto 9) = "0010000" else
            '0' when State = EX0 and IR(15 downto 9) = "0100000" else
            '0' when State = EX0 and IR(15 downto 9) = "1001100" else
            '0' when State = EX0 and IR(15 downto 9) = "1000010" else
            '0' when State = EX0 and IR(15 downto 9) = "1100000" and Z = '1' else
            '0' when State = EX0 and IR(15 downto 9) = "1100000" and Z = '0' else
            '0' when State = EX0 and IR(15 downto 9) = "1100001" and N = '1' else
            '0' when State = EX0 and IR(15 downto 9) = "1100001" and N = '0' else
            '0' when State = EX0 and IR(15 downto 9) = "1110000" else
            
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            '1' when State = EX0 and IR(15 downto 9) = "0010001" else
            '1' when State = EX1 and IR(15 downto 9) = "0010001" else
            
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            '0' when State = EX0 and IR(15 downto 9) = "0001101" and Z = '0' else
            '0' when State = EX0 and IR(15 downto 9) = "0001101" and Z = '1' else
            '0' when State = EX1 and IR(15 downto 9) = "0001101" and Z = '0' else
            '0' when State = EX1 and IR(15 downto 9) = "0001101" and Z = '1' else
            '0' when State = EX2 and IR(15 downto 9) = "0001101" else
            '0' when State = EX3 and IR(15 downto 9) = "0001101" and Z = '0' else
            '0' when State = EX3 and IR(15 downto 9) = "0001101" and Z = '1' else
            '0' when State = EX4 and IR(15 downto 9) = "0001101" else
            
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            '0' when State = EX0 and IR(15 downto 9) = "0001110" and Z = '0' else
            '0' when State = EX0 and IR(15 downto 9) = "0001110" and Z = '1' else
            '0' when State = EX1 and IR(15 downto 9) = "0001110" and Z = '0' else
            '0' when State = EX1 and IR(15 downto 9) = "0001110" and Z = '1' else
            '0' when State = EX2 and IR(15 downto 9) = "0001110" else
            '0' when State = EX3 and IR(15 downto 9) = "0001110" and Z = '0' else
            '0' when State = EX3 and IR(15 downto 9) = "0001110" and Z = '1' else
            '0' when State = EX4 and IR(15 downto 9) = "0001110" else
            '0';
            
      -- New Table Column -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

RW <=       '0' when State = INF else
            '1' when State = EX0 and IR(15 downto 9) = "0000000" else
            '1' when State = EX0 and IR(15 downto 9) = "0000001" else
            '1' when State = EX0 and IR(15 downto 9) = "0000010" else
            '1' when State = EX0 and IR(15 downto 9) = "0000101" else
            '1' when State = EX0 and IR(15 downto 9) = "0000110" else
            '1' when State = EX0 and IR(15 downto 9) = "0001000" else
            '1' when State = EX0 and IR(15 downto 9) = "0001001" else
            '1' when State = EX0 and IR(15 downto 9) = "0001010" else
            '1' when State = EX0 and IR(15 downto 9) = "0001011" else
            '1' when State = EX0 and IR(15 downto 9) = "0001100" else
            '1' when State = EX0 and IR(15 downto 9) = "0010000" else
            '0' when State = EX0 and IR(15 downto 9) = "0100000" else
            '1' when State = EX0 and IR(15 downto 9) = "1001100" else
            '1' when State = EX0 and IR(15 downto 9) = "1000010" else
            '0' when State = EX0 and IR(15 downto 9) = "1100000" and Z = '1' else
            '0' when State = EX0 and IR(15 downto 9) = "1100000" and Z = '0' else
            '0' when State = EX0 and IR(15 downto 9) = "1100001" and N = '1' else
            '0' when State = EX0 and IR(15 downto 9) = "1100001" and N = '0' else
            '0' when State = EX0 and IR(15 downto 9) = "1110000" else
            
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            '1' when State = EX0 and IR(15 downto 9) = "0010001" else
            '1' when State = EX1 and IR(15 downto 9) = "0010001" else
            
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            '1' when State = EX0 and IR(15 downto 9) = "0001101" and Z = '0' else
            '1' when State = EX0 and IR(15 downto 9) = "0001101" and Z = '1' else
            '1' when State = EX1 and IR(15 downto 9) = "0001101" and Z = '0' else
            '1' when State = EX1 and IR(15 downto 9) = "0001101" and Z = '1' else
            '1' when State = EX2 and IR(15 downto 9) = "0001101" else
            '1' when State = EX3 and IR(15 downto 9) = "0001101" and Z = '0' else
            '1' when State = EX3 and IR(15 downto 9) = "0001101" and Z = '1' else
            '1' when State = EX4 and IR(15 downto 9) = "0001101" else
            
      -- New Table Section -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
            '1' when State = EX0 and IR(15 downto 9) = "0001110" and Z = '0' else
            '1' when State = EX0 and IR(15 downto 9) = "0001110" and Z = '1' else
            '1' when State = EX1 and IR(15 downto 9) = "0001110" and Z = '0' else
            '1' when State = EX1 and IR(15 downto 9) = "0001110" and Z = '1' else
            '1' when State = EX2 and IR(15 downto 9) = "0001110" else
            '1' when State = EX3 and IR(15 downto 9) = "0001110" and Z = '0' else
            '1' when State = EX3 and IR(15 downto 9) = "0001110" and Z = '1' else
            '1' when State = EX4 and IR(15 downto 9) = "0001110" else
            '1';
            
      -- New Table Column -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

MM <=       '1' when State = INF else
            '0';
            
      -- New Table Column -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
            
MW <=       '1' when State = EX0 and IR(15 downto 9) = "0100000" else
            '0';

end Behavioral;
