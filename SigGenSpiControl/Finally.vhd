--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:56:35 08/12/2020
-- Design Name:   
-- Module Name:   C:/Users/ulrik/OneDrive - Danmarks Tekniske Universitet/2. semester/3 ugers - Digitaldesign/SigGenSpiControl/Finally.vhd
-- Project Name:  SigGenSpiControl
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SigGenSpiControl
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Finally IS
END Finally;
 
ARCHITECTURE behavior OF Finally IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SigGenSpiControl
    PORT(
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         SCK : IN  std_logic;
         MOSI : IN  std_logic;
         SS : IN  std_logic;
         LED : OUT  std_logic_vector(7 downto 0);
         Shape : OUT  std_logic_vector(1 downto 0);
         Freq : OUT  std_logic_vector(7 downto 0);
         SigEN : OUT  std_logic;
         Ampl : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';
   signal SCK : std_logic := '0';
   signal MOSI : std_logic := '0';
   signal SS : std_logic := '0';

 	--Outputs
   signal LED : std_logic_vector(7 downto 0);
   signal Shape : std_logic_vector(1 downto 0);
   signal Freq : std_logic_vector(7 downto 0);
   signal SigEN : std_logic;
   signal Ampl : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SigGenSpiControl PORT MAP (
          Reset => Reset,
          Clk => Clk,
          SCK => SCK,
          MOSI => MOSI,
          SS => SS,
          LED => LED,
          Shape => Shape,
          Freq => Freq,
          SigEN => SigEN,
          Ampl => Ampl
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		Reset <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		Reset <= '0';

      wait for Clk_period*10;
		
		MOSI <= '0';
		
		wait for Clk_period*10;
		
		MOSI <= '1';
		
		wait for Clk_period*10;
		
		MOSI <= '0';
		
		wait for Clk_period*10;
		
		MOSI <= '1';
      
		wait for Clk_period*10;
		
		MOSI <= '0';	

		wait for Clk_period*10;
		
		MOSI <= '1';	

      wait;
   end process;

END;
