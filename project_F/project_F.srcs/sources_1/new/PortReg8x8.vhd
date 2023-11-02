----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2021 10:21:40 AM
-- Design Name: 
-- Module Name: PortReg8x8 - Behavioral
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

entity PortReg8x8 is
    Port ( Reset : in STD_LOGIC;
           CLK : in STD_LOGIC;
           MW : in STD_LOGIC;
           DataIn : in STD_LOGIC_VECTOR (7 downto 0);
           AddressIn : in STD_LOGIC_VECTOR (7 downto 0);
           SW : in STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC; -- BTN1
           BTNU : in STD_LOGIC; -- BTN2
           BTNL : in STD_LOGIC; -- BTN3
           BTNR : in STD_LOGIC; -- BTN4
           BTND : in STD_LOGIC; -- BTN5
           MMR : out STD_LOGIC := '0';
           Dword : out STD_LOGIC_VECTOR (15 downto 0);
           DataOutR : out STD_LOGIC_VECTOR (15 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0));
end PortReg8x8;

architecture Behavioral of PortReg8x8 is
signal MR0, MR1, MR2, MR3, MR4, MR5, MR6, MR7: STD_LOGIC_VECTOR(7 downto 0) := X"00";

begin

------------------------------------------ Write ------------------------------------------------
process(MW, CLK, Reset)

begin


if RISING_EDGE(CLK) then
    if (Reset = '1') then
          MR0 <= X"00";
          MR1 <= X"00";
          MR2 <= X"00";
    elsif (MW = '1' AND AddressIn = "11111000") then
          MR0 <= DataIn;
    elsif (MW = '1' AND AddressIn = "11111001") then
          MR1 <= DataIn;
    elsif (MW = '1' AND AddressIn = "11111010") then
          MR2 <= DataIn;
    end if; 
 end if;

--------------------------------------------------------------------------------------------------

------------------------------------------ Read --------------------------------------------------
 
 if RISING_EDGE(CLK) then
    if (Reset = '1') then
          MMR <= '0';
          DataOutR <= X"0000";
          LED <= X"00";
          Dword <= X"0000";
    elsif (MW = '0' AND AddressIn = "11111000") then
          MMR <= '1';
          Dword <= "00000000" & MR0;
          DataOutR <= "00000000" & MR0;
    elsif (MW = '0' AND AddressIn = "11111001") then
          MMR <= '1';
          Dword <= "00000000" & MR1;
          DataOutR <= "00000000" & MR1;
    elsif (MW = '0' AND AddressIn = "11111010") then
          MMR <= '1';
          LED <= MR2;
          DataOutR <= "00000000" & MR2;
    elsif (MW = '0' AND AddressIn = "11111011") then
           MMR <= '1';
           DataOutR <= "00000000" & MR3;
    elsif (MW = '0' AND AddressIn = "11111100") then
           MMR <= '1';
           DataOutR <= "00000000" & MR4;
    elsif (MW = '0' AND AddressIn = "11111101") then
           MMR <= '1';
           DataOutR <= "00000000" & MR5;
    elsif (MW = '0' AND AddressIn = "11111110") then
           MMR <= '1';
           DataOutR <= "00000000" & MR6;
    elsif (MW = '0' AND AddressIn = "11111111") then
           MMR <= '1';
           DataOutR <= "00000000" & MR7;
    else
           MMR <= '0';
           DataOutR <= X"0000";
           LED <= X"00";
           Dword <= X"0000";
    end if; 
 end if;
end process;
---------------------------------------------------------------------------------------------------

--------------------------------------------- Buttons ---------------------------------------------
process(BTNR, BTNL, BTND, BTNU, BTNC)
begin

if BTNR = '1' then
    MR3 <= SW;
end if;
if BTNL = '1' then
    MR4 <= SW;
end if;
if BTND = '1' then
    MR5 <= SW;
end if;
if BTNU = '1' then
    MR6 <= SW;
end if;
if BTNC = '1' then
    MR7 <= SW;
end if;
end process;
---------------------------------------------------------------------------------------------------

end Behavioral;
