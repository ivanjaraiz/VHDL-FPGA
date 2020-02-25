
entity contador4bits is
	port( clk : in std_logic;
	      reset, enable : in std_logic;
		  cuenta : out std_logic_vector (3 downto 0);
	end contador4bits;
	
architecture secuencial of contador4bits is
signal cnt : unsigned (3 downto 0);
begin
	process(clk, reset)
	begin
	 if reset = '1' then
	    cnt <= (others => '0');
	 elsif clk'event AND clk = '1' then 
	    if enable = '1' then 
		   cnt <= cnt +1;
		end if; 
	 end if;	
	end process;
	cuenta <= std_logic_vector(cnt);
end secuencial;