library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_alu is
end test_alu;

architecture arch of test_alu is
	signal a, b : std_logic_vector(7 downto 0);
	signal op   : std_logic_vector(1 downto 0);
	signal s    : std_logic_vector(8 downto 0);
begin 
 a <="01100101";
 b <="10010110";
 op <= "00", "01" after 20 ns, "10" after 40 ns, "11" after 60 ns; 
 
 alu1 : entity work.alu(funcional) port map (a,b,op,s);
 
 end arch;
