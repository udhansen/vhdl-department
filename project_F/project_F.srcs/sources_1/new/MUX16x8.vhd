
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX16x8 is
    Port ( 
           D_select : in std_logic_vector(3 downto 0);
           R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15 : in STD_LOGIC_VECTOR (7 downto 0);
           Y_Data : out STD_LOGIC_VECTOR (7 downto 0));
end MUX16x8;

architecture Behavioral of MUX16x8 is

SIGNAL E : STD_LOGIC_VECTOR (15 downto 0);

begin

U0 : entity work.Decoder4x16
port map (  S0=>D_select(0), S1=>D_select(1) , S2=>D_select(2), S3=>D_select(3), E => E);

U1 : entity work.En_32_to_1
port map (E => E, 
R(0) => R0(0), R(1) => R1(0), 
R(2) => R2(0), R(3) => R3(0), 
R(4) => R4(0), R(5) => R5(0), 
R(6) => R6(0), R(7) => R7(0), 
R(8) => R8(0), R(9) => R9(0), 
R(10) => R10(0), R(11) => R11(0), 
R(12) => R12(0), R(13) => R13(0), 
R(14) => R14(0), R(15) => R15(0),
R_Out => Y_Data(0));

U2 : entity work.En_32_to_1
port map (E => E, 
R(0) => R0(1), R(1) => R1(1), 
R(2) => R2(1), R(3) => R3(1), 
R(4) => R4(1), R(5) => R5(1), 
R(6) => R6(1), R(7) => R7(1), 
R(8) => R8(1), R(9) => R9(1), 
R(10) => R10(1), R(11) => R11(1), 
R(12) => R12(1), R(13) => R13(1), 
R(14) => R14(1), R(15) => R15(1),
R_Out => Y_Data(1));

U3 : entity work.En_32_to_1
port map (E => E, 
R(0) => R0(2), R(1) => R1(2), 
R(2) => R2(2), R(3) => R3(2), 
R(4) => R4(2), R(5) => R5(2), 
R(6) => R6(2), R(7) => R7(2), 
R(8) => R8(2), R(9) => R9(2), 
R(10) => R10(2), R(11) => R11(2), 
R(12) => R12(2), R(13) => R13(2), 
R(14) => R14(2), R(15) => R15(2),
R_Out => Y_Data(2));

U4 : entity work.En_32_to_1
port map (E => E, 
R(0) => R0(3), R(1) => R1(3), 
R(2) => R2(3), R(3) => R3(3), 
R(4) => R4(3), R(5) => R5(3), 
R(6) => R6(3), R(7) => R7(3), 
R(8) => R8(3), R(9) => R9(3), 
R(10) => R10(3), R(11) => R11(3), 
R(12) => R12(3), R(13) => R13(3), 
R(14) => R14(3), R(15) => R15(3),
R_Out => Y_Data(3));

U5: entity work.En_32_to_1
port map (E => E, 
R(0) => R0(4), R(1) => R1(4), 
R(2) => R2(4), R(3) => R3(4), 
R(4) => R4(4), R(5) => R5(4), 
R(6) => R6(4), R(7) => R7(4), 
R(8) => R8(4), R(9) => R9(4), 
R(10) => R10(4), R(11) => R11(4), 
R(12) => R12(4), R(13) => R13(4), 
R(14) => R14(4), R(15) => R15(4),
R_Out => Y_Data(4));

U6: entity work.En_32_to_1
port map (E => E, 
R(0) => R0(5), R(1) => R1(5), 
R(2) => R2(5), R(3) => R3(5), 
R(4) => R4(5), R(5) => R5(5), 
R(6) => R6(5), R(7) => R7(5), 
R(8) => R8(5), R(9) => R9(5), 
R(10) => R10(5), R(11) => R11(5), 
R(12) => R12(5), R(13) => R13(5), 
R(14) => R14(5), R(15) => R15(5),
R_Out => Y_Data(5));

U7: entity work.En_32_to_1
port map (E => E, 
R(0) => R0(6), R(1) => R1(6), 
R(2) => R2(6), R(3) => R3(6), 
R(4) => R4(6), R(5) => R5(6), 
R(6) => R6(6), R(7) => R7(6), 
R(8) => R8(6), R(9) => R9(6), 
R(10) => R10(6), R(11) => R11(6), 
R(12) => R12(6), R(13) => R13(6), 
R(14) => R14(6), R(15) => R15(6),
R_Out => Y_Data(6));

U8: entity work.En_32_to_1
port map (E => E, 
R(0) => R0(7), R(1) => R1(7), 
R(2) => R2(7), R(3) => R3(7), 
R(4) => R4(7), R(5) => R5(7), 
R(6) => R6(7), R(7) => R7(7), 
R(8) => R8(7), R(9) => R9(7), 
R(10) => R10(7), R(11) => R11(7), 
R(12) => R12(7), R(13) => R13(7), 
R(14) => R14(7), R(15) => R15(7),
R_Out => Y_Data(7));


end Behavioral;
