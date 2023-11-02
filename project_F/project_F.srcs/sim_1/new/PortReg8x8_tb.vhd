library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity PortReg8x8_tb is
end;

architecture bench of PortReg8x8_tb is

  component PortReg8x8
      Port ( Reset : in STD_LOGIC;
             CLK : in STD_LOGIC;
             MW : in STD_LOGIC;
             DataIn : in STD_LOGIC_VECTOR (7 downto 0);
             AddressIn : in STD_LOGIC_VECTOR (7 downto 0);
             SW : in STD_LOGIC_VECTOR (7 downto 0);
             BTNC : in STD_LOGIC;
             BTNU : in STD_LOGIC;
             BTNL : in STD_LOGIC;
             BTNR : in STD_LOGIC;
             BTND : in STD_LOGIC;
             MMR : out STD_LOGIC;
             Dword : out STD_LOGIC_VECTOR (15 downto 0);
             DataOutR : out STD_LOGIC_VECTOR (15 downto 0);
             LED : out STD_LOGIC_VECTOR (7 downto 0));
  end component;

  signal Reset: STD_LOGIC;
  signal CLK: STD_LOGIC;
  signal MW: STD_LOGIC;
  signal DataIn: STD_LOGIC_VECTOR (7 downto 0);
  signal AddressIn: STD_LOGIC_VECTOR (7 downto 0);
  signal SW: STD_LOGIC_VECTOR (7 downto 0);
  signal BTNC: STD_LOGIC;
  signal BTNU: STD_LOGIC;
  signal BTNL: STD_LOGIC;
  signal BTNR: STD_LOGIC;
  signal BTND: STD_LOGIC;
  signal MMR: STD_LOGIC;
  signal Dword: STD_LOGIC_VECTOR (15 downto 0);
  signal DataOutR: STD_LOGIC_VECTOR (15 downto 0);
  signal LED: STD_LOGIC_VECTOR (7 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: PortReg8x8 port map ( Reset     => Reset,
                             CLK       => CLK,
                             MW        => MW,
                             DataIn    => DataIn,
                             AddressIn => AddressIn,
                             SW        => SW,
                             BTNC      => BTNC,
                             BTNU      => BTNU,
                             BTNL      => BTNL,
                             BTNR      => BTNR,
                             BTND      => BTND,
                             MMR       => MMR,
                             Dword     => Dword,
                             DataOutR  => DataOutR,
                             LED       => LED );

  stimulus: process
  begin
  
    -- Put initialisation code here
    AddressIn <= "00000000";
    DataIn <= "00000000";

    Reset <= '1';
    wait for 5 ns;
    Reset <= '0';
    wait for 5 ns;

    -- Put test bench stimulus code here
        
         BTNC <= '0';
         BTNU <= '0';
         BTNL <= '0';
         BTNR <= '0';
         BTND <= '0';
         SW <= X"00";
        
        MW <= '1';
        AddressIn <= "11111000";
        DataIn <= "10101011";
        wait for clock_period*2;
        
        MW <= '1';
        AddressIn <= "11111001";
        DataIn <= "00101010";
        wait for clock_period*2;
        
        MW <= '1';
        AddressIn <= "11111010";
        DataIn <= "10001001";
        wait for clock_period*2;
        
        MW <= '1';
        AddressIn <= "00111000";
        DataIn <= "01101110";
        wait for clock_period*2;
            
        MW <= '1';
        AddressIn <= "00111000";
        DataIn <= "00101010";
        SW <= "00110011";
        BTNL <= '1';
        wait for clock_period*2;
                
        MW <= '0';
        AddressIn <= "00111000";
        DataIn <= "00101010"; 
        SW <= "00111111";
        BTNR <= '1';
        wait for clock_period*2;
        
        MW <= '0';
        AddressIn <= "11111000"; 
        SW <= "00101111";
        BTNU <= '1';
        wait for clock_period*2;
        
        MW <= '0';
        AddressIn <= "11111001";
        SW <= "10111111";
        BTND <= '1';
        wait for clock_period*2;
        
        MW <= '0';
        AddressIn <= "11111010";
        SW <= "10111111";
        BTND <= '1';
        wait for clock_period*2;
        
        MW <= '0';
        AddressIn <= "00011000";
        SW <= "10110110";
        BTNC <= '1';
        wait for clock_period*2;


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