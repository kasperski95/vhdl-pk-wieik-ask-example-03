library ieee;
use ieee.std_logic_1164.all;


entity task_03_core_tb is
end task_03_core_tb;


architecture test of task_03_core_tb is
  component task_03_core
    port ( 
      clk, rst : in std_logic;
      bits : in std_logic_vector(15 downto 0);
      out_a : out std_logic_vector(15 downto 0);
      out_b : out std_logic_vector(15 downto 0)
    );
  end component;

  signal clk, rst : std_logic;
  signal bits : std_logic_vector(15 downto 0);
  signal out_a, out_b : std_logic_vector(15 downto 0);

begin
  task_03_core_inst: task_03_core port map (bits => bits, clk => clk, rst => rst, out_a => out_a, out_b => out_b);
  
  process begin
    -- first number
    clk <= '0';
    bits <= "0000000000000001";
    wait for 1 ns;

    clk <= '1'; wait for 1 ns;
    
    -- second number
    clk <= '0';
    bits <= "0000000000000010";
    wait for 1 ns;


    clk <= '1'; wait for 1 ns;

    --reset 1
    clk <= '0';
    rst <= '1';
    wait for 1 ns;

    clk <= '1'; wait for 1 ns;

    --reset 0
    clk <= '0';
    rst <= '0';
    wait for 1 ns;

    clk <= '1'; wait for 1 ns;


    assert false report "End of the test";
    wait;

  end process;
end test;