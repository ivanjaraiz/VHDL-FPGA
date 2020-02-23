--- PARTIR CACHOS DE ARRAYS DE BITS Y CONCATERNAR BITS ---


signal flag : boolean := false; -- se inicializa con false, pero solo sirve para simulación. Para implementación no es así. 

--declaración de un costante: 
--	-numero de bits
--	-retardos
constant numero_de_bits : integer :=16;
--vector de bits de 16 bits! 15 downto 0 y se asgina 0 a todos. Esta inicialización sirve para simulación. 
signal B : std_logic_vector (numero_de_bits-1 downto 0) := (others=>'0');

-- de 1 bits
signal A : std_logic;

-- C es un valor sin signo de 8 bits. 
signal C : unsigned(7 downto 0);
-- D valor con signo de 8 bits.  (complemento A2)
--* de derecha a izquierda buscar el primer 1 y mantenerlo y a partir de ahí los demás cambiar, es decir: 
--  10(decimal)   =>00001010 
--	-10 (decimal) =>11110110
--* el bit mas significativo representa el signo: (+)0 y (-)1. 
-- fuente: 
--  https://www.youtube.com/watch?v=K-IJTvEDBYw
--

signal D : signed(7 downto 0);

-- es un entero que tiene un rango desde 0 a 1023 en entero
signal E : integer range 0 to 1023;

-----------------------------------------------
--Asignar un valor a un booleano
-----------------------------------------------
flag <= true;

-----------------------------------------------
--Asignar un valor a un std_logic (de un bit)
-----------------------------------------------
A <= '0';
-----------------------------------------------
--Asignar valores a std_logic_vector (vector de bits)
-----------------------------------------------
-- poner un numero decimal, siempre que esté en el rango que permite B
-- como son 16 bits, tenemos 2^15.. 
-- En este caso el valor decimal 12334 lo convertimo a un array de 16 bits. 
-- usamos la función de conversión entero-std_logic_vector
B <= conv_std_logic_vector(12334,16);
-- asignar un valor en hexadecimal
B <= x"BEEF";
-- con esto es complicado, facil equivocarse, dificil de entender. 
B <= "10010010010010";

-----------------------------------------------
--Acceder a un subconjunto de bits de un std_logic_vector
-----------------------------------------------
-- podemos coger el bit 7 de B(std_logic_vector) y asignarlo a A que es un std_logic 
A <=B(7);

-----------------------------------------------
--Asignar valores a unsigned y signed
-----------------------------------------------
-- 8 buits menos significativos de B (std_logic_vector) convertirlos a unsigned, y pasorlos a C(unsigned) de 8 bits. 
C <= unsigned(B(7 downto 0));
C <= x"4B";
-- estos son valores en bruto, es decir, en este caso es un número positivo por que el MSB es '0'
C <= "0100101";

D <= signed(B(15 downto 8)); --asignación de los bits mas MSB, se convierte a signed y se asigna a D(signed) de 8 bits. 
D <= "11111101"; --OJO!!!! son numero en C2, es decir, es -3. 

-----------------------------------------------
--Asignar valores a un integer
-----------------------------------------------
E <=56; -- podemos asignar valores desde 0 a 1023 en decimal. 
E <= 16#AE#; -- en base 16 asignamos el valor AE. 
------- NOTA -------------------
-- base 10 es decimal
-- base 2 es complemento a 2. 
-------------------------------- 
-----------------------------------------------
--Asignar std_logic_vector a integer 
-----------------------------------------------
-- B (std_logic_vector) lo paso a entero para asignar a E, sin pasarse de rango!!!!
E <= conv_integer(signed(B)); 
E <= conv_integer(unsigned(B)); 

-----------------------------------------------
-- Concaternar std_logic_vector
-----------------------------------------------
B <= std_logic_vector(C) & std_logic_vector(D);

