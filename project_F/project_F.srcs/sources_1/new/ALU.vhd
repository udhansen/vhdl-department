
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2021 11:09:09 AM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           J_select : in STD_LOGIC_VECTOR (3 downto 0);
           G : out STD_LOGIC_VECTOR (7 downto 0);
           V : out STD_LOGIC;
           Cout : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

-- Define components
component FULL_ADDER_8bit is
    Port ( X, Y, Cin : in STD_LOGIC;
           Cout, G : out STD_LOGIC);
end component FULL_ADDER_8bit;

component Logic_Circ is
    Port (Ai, Bi: in STD_LOGIC_VECTOR(7 downto 0);
          Sel: in STD_LOGIC_VECTOR(1 downto 0);
          G: out STD_LOGIC_VECTOR(7 downto 0));
end component Logic_Circ;

component MUX_2_1 is
    Port ( X, Y: in STD_LOGIC_VECTOR(7 downto 0);
           S : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR(7 downto 0));
end component MUX_2_1;
    
-- Define signals
signal Bsig, LCsig, FAsig: STD_LOGIC_VECTOR(7 downto 0);
signal Sel: STD_LOGIC_VECTOR(1 downto 0);
signal C1, C2, C3, C4, C5, C6, C7, C8, Cin, S0, S1, S2: STD_LOGIC;

begin
        
        Cin <= J_select(0);
        S0 <= J_select(1);
        S1 <= J_select(2);
        S2 <= J_select(3);
        
        
        -- 8 Full-adders 
        FA1: FULL_ADDER_8Bit port map(X => A(0), Y => Bsig(0), Cin => Cin, Cout => C1, G => FAsig(0));
        
        FA2: FULL_ADDER_8Bit port map(X => A(1), Y => Bsig(1), Cin => C1, Cout => C2, G => FAsig(1));
        
        FA3: FULL_ADDER_8Bit port map(X => A(2), Y => Bsig(2), Cin => C2, Cout => C3, G => FAsig(2));
        
        FA4: FULL_ADDER_8Bit port map(X => A(3), Y => Bsig(3), Cin => C3, Cout => C4, G => FAsig(3));
        
        FA5: FULL_ADDER_8Bit port map(X => A(4), Y => Bsig(4), Cin => C4, Cout => C5, G => FAsig(4));
        
        FA6: FULL_ADDER_8Bit port map(X => A(5), Y => Bsig(5), Cin => C5, Cout => C6, G => FAsig(5));
        
        FA7: FULL_ADDER_8Bit port map(X => A(6), Y => Bsig(6), Cin => C6, Cout => C7, G => FAsig(6));
        
        FA8: FULL_ADDER_8Bit port map(X => A(7), Y => Bsig(7), Cin => C7, Cout => C8, G => FAsig(7));
        
        V <= C7 XOR C8; -- Overflow
        Cout <= C8; -- Carry out
              
        -- Input circuit
        Bsig(0) <= (B(0) and S0) or (not B(0) and S1);
        Bsig(1) <= (B(1) and S0) or (not B(1) and S1);
        Bsig(2) <= (B(2) and S0) or (not B(2) and S1);
        Bsig(3) <= (B(3) and S0) or (not B(3) and S1);
        Bsig(4) <= (B(4) and S0) or (not B(4) and S1);
        Bsig(5) <= (B(5) and S0) or (not B(5) and S1);
        Bsig(6) <= (B(6) and S0) or (not B(6) and S1);
        Bsig(7) <= (B(7) and S0) or (not B(7) and S1);
        
        -- Logic Circuit
        L1: Logic_Circ port map(Ai => A, Bi => B, Sel => Sel, G => LCsig);
        
        Sel <= S0 & Cin;
        
        -- Multiplexer for specific display
        MUX21: MUX_2_1 port map(X => FAsig, Y => LCsig, S => S2, G => G);
        
end Behavioral;