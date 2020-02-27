library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; --paquete para funciones de conversión. 

entity memoria_rom is
port( 
-- Indica posición de la memoria que tenemos el dato a leer. 
-- direcciona desde 0 a 2^3-1 posiciones. 	 
	 addr : in std_logic_vector(2 downto 0);
-- Nos proporciona el dato que queremos leer.
-- devuelve palabras de ancho 16 bits.  	  
	  dout : out std_logic_vector(15 downto 0));
end memoria_rom;

 architecture funcional of memoria_rom is 
  -- declaración de un tipo que es un array de 8 elementos de palabras de ancho 16 bits. 
  type rom_t is array (0 to 7) of std_logic_vector (15 downto 0);
  -- contiene los valores que se van a predeterminar para esa memoria ROM. Todo en hexadecimal. 
  constant ROM_array : rom_t :=
  (x"0EC4", 
   x"4BD2", 
   x"4D7B", 
   x"6C42", 
   x"02F1", 
   x"7D16", 
   x"4500", 
   x"2F9F");
  
  begin
 -- para devolver los valores de la memoria rom:
 -- se carga con lo valores de ROM_array, que se acceden por las lineas de direccion addr. 
 -- se convierten desde std_logic_vector a entero. 
 -- con el paquete arith podemos utilizar la direcciones para acceder a datos y devolver los valores
 -- de la constante ROM array
 
 dout <= ROM_array(conv_integer(unsigned(addr)));
 end funcional; 
 
 

