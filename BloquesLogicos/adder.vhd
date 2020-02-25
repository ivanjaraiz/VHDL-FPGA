library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity add_n is
 generic(n: integer:=8);
 port (	a, b: in std_logic_vector(n-1 downto 0);
	c_in: in std_logic;
	s: out std_logic_vector(n-1 downto 0);
	c_out: out std_logic);
end add_n; 


architecture funcional of add_n is
	signal long_a, long_b, long_carry, long_s: std_logic_vector(n downto 0);
begin
	long_a <= '0'&a; long_b <= '0'&b;
	long_carry <= conv_std_logic_vector(0,n)&c_in;
	long_s <= long_a + long_b + long_carry;
	s <= long_s(n-1 downto 0);
	c_out <= long_s(n);
end funcional; 

library ieee;
use ieee.std_logic_1164.all;

entity adder_nexys4 is
  port (sw : in std_logic_vector(15 downto 0);
        led : out std_logic_vector (7 downto 0) 
      );
end adder_nexys4;

architecture circuito of adder_nexys4 is

begin


add_8 : entity work.add_n(funcional) port map(sw(15 downto 8),sw(7 downto 0),'0', led, open);

end circuito; 