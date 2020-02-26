library ieee;
use ieee.std_logic_1164.all;

entity DectectorDeSecuencia is
  port (x, clk, reset : in std_logic;
        z: out std_logic);
end DectectorDeSecuencia;

architecture FSM_Mealy of DectectorDeSecuencia is
-- declaración de tipo de datos enumerado que estados y tiene tres elementos S0, S1 y S2. 
type estados is (S0, S1, S2); 
-- declaración de señales ns,ps de tipo estados, es decir, sus valores pueden ser S0, S1 y S2. 
signal ns, ps : estados; 
begin

ActualizacionDeEstado : process(clk, reset)
begin 
 if reset = '1' then
	ps <= S0;
 elsif rising_edge(clk) then
	-- asignación de NextState a PresentState. 
	-- se modela como en el registro se carga el 
	-- siguiente estado en estado presente. 
	ps <= ns;
 end if;	
end process ActualizacionEstado;

CambioDeEstadoYSalida: process (x, ps)
begin
 z <= '0';
 case ps is
	when S0 =>
		if x = '0' then ns <=S1; z <= '0';
		else 			ns <=S0; z <='0';
		end if;
	when S1 =>
		if x = '0' then ns <= S1; z <='0';
		else			ns <= S2; z <='0';
		end if;
	when S2 =>
		if x = '0' then ns <= S1; z <='0';
		else 			ns <= S0; z <='1';
		end if;
	when others => 		ns <= S0; z <='0';
 end case; 		
end process CambioDeEstadoYSalida;

end FSM_Mealy;