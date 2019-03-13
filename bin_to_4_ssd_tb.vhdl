library ieee;
use ieee.std_logic_1164.all;


entity bin_to_4_ssd_tb is
end bin_to_4_ssd_tb;


architecture test of bin_to_4_ssd_tb is
  component bin_to_4_ssd
    port(
      bin : in std_logic_vector(15 downto 0);
      ssd0 : out std_logic_vector(0 to 6);
      ssd1 : out std_logic_vector(0 to 6);
      ssd2 : out std_logic_vector(0 to 6);
      ssd3 : out std_logic_vector(0 to 6)
    );
  end component;

  signal bin : std_logic_vector(15 downto 0);
  signal ssd0 : std_logic_vector(0 to 6);
  signal ssd1 : std_logic_vector(0 to 6);
  signal ssd2 : std_logic_vector(0 to 6);
  signal ssd3 : std_logic_vector(0 to 6);

begin
  bin_to_4_ssd_inst: bin_to_4_ssd port map (bin => bin, ssd0 => ssd0, ssd1 => ssd1, ssd2 => ssd2, ssd3 => ssd3);
  
  process begin
    bin <= "0101010101010101";
    wait for 1 ns;
    bin <= "0000000100100011";
    wait for 1 ns;
    
    assert false report "End of the test";
    wait;
  end process;
end test;