library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_contador is 
end test_contador;

architecture arch of test_contador is
	signal clk : std_logic := '0';
	signal rst, enable : std_logic;
	signal cuenta : std_logic_vector(7 downto 0);
	signal findecuenta : std_logic;
 begin
 
	clk <= not(clk) after 10 ns;
	enable <= '1', '0' after 40 ns, '1' after 80 ns; 
	rst <= '1', '0' after 10 ns;
	
	contador1 : entity work.contador(funcional) --entidad(arquitectura)
			    port map (cl, rst, enable, cuenta, findecuenta);
 end arch;			   