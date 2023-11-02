----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2021 10:02:05 AM
-- Design Name: 
-- Module Name: 7segdriver_tb - Behavioral
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
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity SevenSegDriver_tb is
end;

architecture bench of SevenSegDriver_tb is

  component SevenSegDriver
      Port ( Reset: in STD_LOGIC;
             CLK: in STD_LOGIC;
             Dword : in STD_LOGIC_VECTOR (15 downto 0);
             Anode: out STD_LOGIC_VECTOR(7 downto 0);
             Cathode : out STD_LOGIC_VECTOR (7 downto 0));
  end component;

  signal Reset: STD_LOGIC;
  signal CLK: STD_LOGIC;
  signal Dword: STD_LOGIC_VECTOR (15 downto 0);
  signal Anode: STD_LOGIC_VECTOR(7 downto 0);
  signal Cathode: STD_LOGIC_VECTOR (7 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: SevenSegDriver port map ( Reset   => Reset,
                                 CLK     => CLK,
                                 Dword   => Dword,
                                 Anode   => Anode,
                                 Cathode => Cathode );

  stimulus: process
  begin
    
    Dword <= X"0000";
    -- Put initialisation code here

    Reset <= '1';
    wait for 5 ns;
    Reset <= '0';
    wait for 5 ns;
    
    Dword <= "0000000011011100";
    wait for clock_period*2;
    
    Dword <= "0000000011011100";
    wait for clock_period*2;
        
    Dword <= "0000000011011100";
    wait for clock_period*2;
            
    
    
    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      CLK <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;

