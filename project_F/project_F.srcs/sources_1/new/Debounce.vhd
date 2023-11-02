----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2021 11:45:42 AM
-- Design Name: 
-- Module Name: Debounce - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Debounce is
    Port ( Reset : in STD_LOGIC;
           CLK : in STD_LOGIC;
           BTN_in : in STD_LOGIC;
           BTN_out : out STD_LOGIC);
end Debounce;

architecture Behavioral of Debounce is

constant Counter_Limit: integer := 5;
constant BTN_down: STD_LOGIC := '1';

signal Counter: integer := 0;
type state_type is (BTNready, BTNNotReady);
signal state: state_type := BTNready;

begin

process(Reset, CLK)
begin
    if(Reset = '1') then
    state <= BTNready;
    BTN_out <= '0';
    elsif(RISING_EDGE(CLK)) then
        case (state) is
            when BTNready => 
            if (BTN_in = BTN_down) then
                state <= BTNNotReady;
            else 
                state <= BTNready;
            end if;
            BTN_out <= '0';
     when BTNNotReady => 
        if (Counter = Counter_Limit) then
            Counter <= 0;
            if(BTN_in = BTN_down) then 
                BTN_out <= '1';
            end if;
            state <= BTNready;
            else
            Counter <= Counter + 1;
            end if;
     end case;
     end if;
end process;

end Behavioral;
