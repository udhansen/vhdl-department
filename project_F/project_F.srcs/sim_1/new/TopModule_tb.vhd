library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity TopModule_tb is
end;

architecture bench of TopModule_tb is

  component TopModule
      port (  Reset : in STD_LOGIC;
              CLK : in std_logic;
              LED : out std_logic_vector(7 downto 0);
              SW  : in std_logic_vector(7 downto 0);
              BTNC : in STD_LOGIC;
              BTNU : in STD_LOGIC;
              BTNL : in STD_LOGIC;
              BTNR : in STD_LOGIC;
              BTND : in STD_LOGIC;
              Anode : OUT std_Logic_vector(7 downto 0);
              Cathode : out std_logic_vector(7 downto 0)
          );
  end component;

  signal Reset: STD_LOGIC;
  signal CLK: std_logic;
  signal LED: std_logic_vector(7 downto 0);
  signal SW: std_logic_vector(7 downto 0);
  signal BTNC: STD_LOGIC;
  signal BTNU: STD_LOGIC;
  signal BTNL: STD_LOGIC;
  signal BTNR: STD_LOGIC;
  signal BTND: STD_LOGIC;
  signal Anode: std_Logic_vector(7 downto 0);
  signal Cathode: std_logic_vector(7 downto 0) ;

  constant clock_period: time := 1000 ns;
  --signal stop_the_clock: boolean;
  signal stop_the_clock: std_logic:='1';

begin

  uut: TopModule port map ( Reset   => Reset,
   
   
                            CLK     => CLK,
                            LED     => LED,
         
                            SW      => SW,
                            BTNC    => BTNC,
                            BTNU    => BTNU,
                            BTNL    => BTNL,
                            BTNR    => BTNR,
                            BTND    => BTND,
                            Anode   => Anode,
                            Cathode => Cathode );

  stimulus: process
  begin
 
    Reset <='1';
    wait for clock_period*2;
    Reset <='0';
    wait for clock_period*20;
  
    -- Put initialisation code here
      
    SW <= X"02";
    BTNR <= '0';
    BTNC <= '0';
    BTNL <= '0';
    BTND <= '0';
    BTNU <= '1';
    wait for clock_period*2;
    
    
    BTNU <= '0';
    wait for clock_period*2;
    
    SW <= X"03";
    BTND <= '1';
    wait for clock_period*2;
    
    BTND <= '0';
    wait for clock_period*2;
    
    wait for clock_period*60;
   
    -- Put test bench stimulus code here

    stop_the_clock<='0';
    wait;
  end process;

  clocking: process
  begin
    while stop_the_clock='1' loop
      Clk <= '0';
      wait for clock_period*0.5;
      Clk <= '1';
      wait for clock_period*0.5;
    end loop;
    wait;
  end process;

end;