
entity mux4a1 is
	port( enable : in std_logic;
	      x : in std_logic_vector (3 downto 0);
		  sel : in std_logic_vector (1 downto 0);
		  y : out std_logic);
	end mux4a1;
architecture functional of mux4a1 is
begin
	process(enable, x, sel)
	begin
	 if enable = '0' then <= '0';
	   else
		  case sel is
			when "00" => y <= x(0);
			when "01" => y <= x(1);
			when "10" => y <= x(2);
			when "11" => y <= x(3);
			when others => y <='0';
		  end case;
	  end if;
	end process;
end functional;