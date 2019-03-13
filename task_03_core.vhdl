library ieee;
use ieee.std_logic_1164.all;


entity task_03_core is
  port ( 
    bits : in std_logic_vector(0 to 15);
    clk : in std_logic;
    rst : in std_logic;
    result_a : out std_logic_vector(0 to 15);
    result_b : out std_logic_vector(0 to 15)
  );
end task_03_core;


architecture logic of task_03_core is
  signal number_a : std_logic_vector(15 downto 0);
  signal state : std_logic_vector(0 downto 0);
  constant reading : std_logic_vector(0 downto 0) := "0";
  constant displaying : std_logic_vector(0 downto 0) := "1";
  
begin
    process(clk) begin
      if rising_edge(clk) then   
        case state is
          when reading =>
            number_a <= bits;
            result_a <= "XXXXXXXXXXXXXXXX";
            result_b <= "XXXXXXXXXXXXXXXX";
            state <= displaying;

          when displaying => 
            result_a <= number_a;
            result_b <= bits;
          when others => null;
        end case;
      end if;
    end process;

end logic;