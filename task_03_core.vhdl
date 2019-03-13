library ieee;
use ieee.std_logic_1164.all;


entity task_03_core is
  port ( 
    clk, rst : in std_logic;
    bits : in std_logic_vector(15 downto 0);
    out_a : out std_logic_vector(15 downto 0);
    out_b : out std_logic_vector(15 downto 0)
  );
end task_03_core;


architecture logic of task_03_core is
  constant reading : std_logic_vector(0 downto 0) := "0";
  constant displaying : std_logic_vector(0 downto 0) := "1";
  signal state : std_logic_vector(0 downto 0) := reading;
  
begin
    process(clk, rst)
      variable number_a : std_logic_vector(15 downto 0);
    begin
      if (rst = '1') then
        state <= reading;
        out_a <= "XXXXXXXXXXXXXXXX";
        out_b <= "XXXXXXXXXXXXXXXX";
        number_a := "XXXXXXXXXXXXXXXX";
      elsif rising_edge(clk) then 
        case state is
          when reading =>
            number_a := bits;
            out_a <= "XXXXXXXXXXXXXXXX";
            out_b <= "XXXXXXXXXXXXXXXX";
            state <= displaying;

          when displaying => 
            out_a <= number_a;
            out_b <= bits;
          when others => null;
        end case;
      end if;
    end process;

end logic;