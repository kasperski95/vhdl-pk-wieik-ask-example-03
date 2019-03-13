library ieee;
use ieee.std_logic_1164.all;


entity wrapper_tb is
end wrapper_tb;


architecture arch of wrapper_tb is
  component wrapper
    port(
      SW : in std_logic_vector(15 downto 0);
      KEY : in std_logic_vector(1 downto 0);
      HEX0 : out std_logic_vector(0 to 6);
      HEX1 : out std_logic_vector(0 to 6);
      HEX2 : out std_logic_vector(0 to 6);
      HEX3 : out std_logic_vector(0 to 6);
      HEX4 : out std_logic_vector(0 to 6);
      HEX5 : out std_logic_vector(0 to 6);
      HEX6 : out std_logic_vector(0 to 6);
      HEX7 : out std_logic_vector(0 to 6)
    );
  end component;

  signal SW : std_logic_vector(15 downto 0);
  signal KEY : std_logic_vector(1 downto 0);
  signal HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : std_logic_vector(0 to 6);

begin
  wrapper_inst: wrapper port map(SW, KEY, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
  process
  begin
    SW <= "0000000100100011";
    KEY <= "00";
    wait for 1 ns;

    KEY <= "10";
    wait for 1 ns;

    SW <= "1111111111111111";
    KEY <= "00";
    wait for 1 ns;

    KEY <= "10";
    wait for 1 ns;

    KEY <= "00";
    wait for 1 ns;

    KEY <= "10";
    wait for 1 ns;

    assert false report "end of the test"
    wait;
  end process;
end arch;