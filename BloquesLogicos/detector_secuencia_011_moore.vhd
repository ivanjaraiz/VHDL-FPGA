architecture FSM_Moore of DetectorDeSecuencia is
type estados is (S0,S1,S2,S3);
signal ns, ps : estados; 
begin

ActualizacionDeEstado : process (clk, reset) --pasa SiguienteEstado a EstadoPresente
 begin 
  if reset = '1' then 
    ps <= S0;
  elsif rising_edge(clk) then
    ps <=ns;
  end if;
end process ActualizacionDeEstado;

CambioDeEstado: process(x, ps)--con un case, según entrada así estado.
 begin
  ns <= s0;
  case ps is 
			when S0 =>
				if x = '0' then ns <=S1;
				else            ns <=S0;
				end if;
			when S1 =>
				if x = '0' then ns <=S1;
				else            ns <=S2;
				end if;
			when S2 =>
				if x = '0' then ns <=S1;
				else 			ns <=S3;
			when S3 =>
				if x = '0' then ns <=S1;
				else 			ns <=S0;
				end if;
			when others => 		ns <=S0;
   end case;		

end process CambioDeEstado;

CambioDeSalida: process(ps) -- Y el estado de reporta la salida. Solo está disparado por 
-- estado presente porque es una máquina de moore.  
 begin 
	z <= '0';
	case ps is 
		when S0 => z <='0';
		when S1 => z <='0';
		when S2 => z <='0';
		when S3 => z <='1';
	end case;
end process CambioDeSalida;

end FSM_Moore;