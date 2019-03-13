library ieee;
use ieee.std_logic_1164.all;


entity bin_to_4_ssd is
  port(
    bin : in std_logic_vector(15 downto 0);
    ssd0 : out std_logic_vector(0 to 6);
    ssd1 : out std_logic_vector(0 to 6);
    ssd2 : out std_logic_vector(0 to 6);
    ssd3 : out std_logic_vector(0 to 6)
  );
end bin_to_4_ssd;


architecture logic of bin_to_4_ssd is
  component hex7seg
    port (
      hex : in std_logic_vector(3 downto 0);
      display	: out	std_logic_vector(0 to 6)
    );
  end component;

begin
  hex7seg_0: hex7seg port map (hex => bin(3 downto 0), display => ssd3);
  hex7seg_1: hex7seg port map (hex => bin(7 downto 4), display => ssd2);
  hex7seg_2: hex7seg port map (hex => bin(11 downto 8), display => ssd1);
  hex7seg_3: hex7seg port map (hex => bin(15 downto 12), display => ssd0);
  
end logic;