library ieee;
use ieee.std_logic_1164.all;


entity wrapper is
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
end wrapper;


architecture mapping of wrapper is
  component task_03_core
    port(
      clk, rst : in std_logic;
      bits : in std_logic_vector(15 downto 0);
      out_a : out std_logic_vector(15 downto 0);
      out_b : out std_logic_vector(15 downto 0)
    );
  end component;

  component bin_to_4_ssd
    port(
      bin : in std_logic_vector(15 downto 0);
      ssd0 : out std_logic_vector(0 to 6);
      ssd1 : out std_logic_vector(0 to 6);
      ssd2 : out std_logic_vector(0 to 6);
      ssd3 : out std_logic_vector(0 to 6)
    );
  end component;

  signal wire_a : std_logic_vector(15 downto 0);
  signal wire_b : std_logic_vector(15 downto 0);

begin
  task_03_core_inst : task_03_core port map(KEY(1), KEY(0), SW, wire_a, wire_b);
  bin_to_4_ssd_A : bin_to_4_ssd port map(wire_a, HEX0, HEX1, HEX2, HEX3);
  bin_to_4_ssd_B : bin_to_4_ssd port map(wire_b, HEX4, HEX5, HEX6, HEX7);

end mapping;