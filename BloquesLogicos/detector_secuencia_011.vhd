library ieee;
use ieee.std_logic_1164.all;

entity DectectorDeSecuencia is
  port (x, clk, reset : in std_logic;
        z: out std_logic);
end DectectorDeSecuencia;

architecture FSM_Mealy of DectectorDeSecuencia is
type estados is (S0, S1, S2);
signal ns, ps : estados;
begin

ActualizacionEstado : process(clk, reset)
...
end process ActualizacionEstado;

CambioDeEstadoYSalida: process (x, ps)
...
end process CambioDeEstadoYSalida;

end FSM_Mealy;