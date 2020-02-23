Estructura general de una arquitectura es:

architecture NombreDeLaArquitectura of UnaEntidad is
--zona de declaraciones
begin
--cuerpo de la arquitectura
	-- colocación de componentes (instanciación)
	UnaEtiqueta: UnComponente
			generic map(...)
			port map(...);
	-- asignación de señales
	a <= (b and c) or (c and d) after 5 ns;
	-- Procesos
	process
		-- declaraciones del proceso
	begin
		-- cuerpo del proceso
	end process;
...	
end NombreDeLaArquitectura;