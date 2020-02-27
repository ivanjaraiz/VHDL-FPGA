library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity memoria_ram is
port(
	  clk : in std_logic; -- sincronización de reloj
	  we  : in std_logic; -- para habilitación de escritura
	  addr: in std_logic_vector(2 downto 0); --  tenemos 2^3-1 , es decir, 8 posiciones 
	  din : in std_logic_vector(15 downto 0); -- escribimos palabras de 16 bits. 
	  dout: out std_logic_vector(15 downto 0));
end memoria_ram;

architecture funcional of memoria_ram is 
 type ram_t is array (0 to 7) of std_logic_vector (15 downto 0);
 signal RAM : ram_t;
 begin
  process(clk)
   begin
    if (clk'event and clk = '1') then 
	  if (we = '1') then
		-- se mete el dato en la posición de addr en RAM. 
	    RAM(conv_integer(unsigned(addr))) <= din;
	  end if;
	end if;
  end process;
  -- en la posición addr de RAM se pasa a la salida. 
  dout <= RAM(conv_integer(unsigned(addr)));
  end funcional;
  