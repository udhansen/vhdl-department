library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ZeroFiller2_tb is
end;

architecture bench of ZeroFiller2_tb is

  component ZeroFiller2
      Port ( Data_Out : in STD_LOGIC_VECTOR (7 downto 0);
             Data_in : out STD_LOGIC_VECTOR (15 downto 0));
  end component;

  signal Data_Out: STD_LOGIC_VECTOR (7 downto 0);
  signal Data_in: STD_LOGIC_VECTOR (15 downto 0);

begin

  uut: ZeroFiller2 port map ( Data_Out => Data_Out,
                              Data_in  => Data_in );

  stimulus: process
  begin
  
  
  
    -- Put initialisation code here
    Data_Out <= X"00";
    
    wait for 10ns;
    
    Data_Out <= X"10";
    
    wait for 10ns;
    
    Data_Out <= X"01";
    
    wait for 10ns;
    
    Data_Out <= X"11";

    wait for 10ns;

    -- Put test bench stimulus code here

    wait;
  end process;


end;