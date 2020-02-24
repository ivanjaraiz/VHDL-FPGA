CREAR UN NUEVO REPOSITORIO EN LOCAL

En este apartado se describe como yo he creado el repositorio. 
En primer lugar, he inicializado el el proyecto git en el directorio VHDL-FPGA. 

	$ git init

En segundo lugar, configuro email y el nombre: 

	$ git config --global user.email "ivan.jaraiz@gmail.com"
	$ git config --global user.name "ijm"

en tercer lugar, listo los comandos básicos que sueo usar: 

	$ git status // para ver es estado de los archivos
	$ git add [nombre_archivo] // para agregar un archivo al staging area
	$ git commit -m "mensaje" // para crear punto de control (FOTO DEL PROYECTO)
	$ git commit  (esta opción se mete en vim , se pulsa "i" para insertar texto y ESC, :wq para salir de vim)
	$ git log // para ver los commits creados. 
	$ git branch // ver rammas. 
	$ git checkout [nombre_rama_destino]
	
En cuento lugar, los mas avanzados o que no uso tanto son: 
	* Merge, para unir ramas. ESTO LO TENGO PENDIENTE. 
	*Crear fichero .gitignore donde se listan todos los archivos o carpetas que se ignoran. 
	*Ver diferencias entre códigos de un mismo fuente, así:  
			$ git diff [nombre_fichero] [+ lo nuevo agregado, - lo que se ha quitado]
			
			
Por último, cuando se ha hecho todas las modificaciones en LOCAL, se genera un commit y push al reporSERVER: 

	$ git remote add origin https://github.com/ivanjaraiz/C_Cpp-ARM.git [la dirección que sea]
 	$ git push -u origin master	
	
	


	
SINCRONIZAR REPOSITORIO LOCAL CON REPOSITORIO EN GITHUB

En este documento se describen los pasos usados para generar la sincronización entre:
(Comento también los problemas que me ido encontrando)
 
	-git-bash for windows
	-github
	
En primer lugar, como estoy usando como sistema nativo Windows, para activar el ssh-agent hago lo siguiente: 

	# start the ssh-agent in the background
	$ eval $(ssh-agent -s)
	> Agent pid 1742

En segungo lugar, verifico si tengo llave privada generada y cargada en SSH. Hago lo siguiente: 

	$ ssh-add -l
	The agent has no identities.

En tercer lugar, genero una nueva llave SSH. Hago lo siguiente: 

	$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
	[aquí en terminal puedo se visualiza la imagen de la Key]
	ssh-keygen -t rsa -b 4096 -C "ivan.jaraiz@gmail.com"

	
Aquí es donde se guarda la clave: 
	
	> Enter a file in which to save the key (/c/Users/you/.ssh/id_rsa):[Press enter]
	
Esto para escribir una contraseña segura: 
	
	> Enter passphrase (empty for no passphrase): [Type a passphrase]
	> Enter same passphrase again: [Type passphrase again]
	

En cuarto lugar, agrego la llave Privada SSH al ssh-agent. 
	
	ssh-add ~/.ssh/id_rsa

En último lugar, Agrego la clave SSH a la cuenta de github. Por un lado, copio el id_rsa.pub y 
lo pego en mi perfil de github en : Setting/SSH and CPG keys/ New SSH Key y en el campo Key pego
el id. (lo que se pega en un parrafaco de numeros y letras.. )
	
	
	$ clip < ~/.ssh/id_rsa.pub
	# Copies the contents of the id_rsa.pub file to your clipboard



Con todo lo anterior ya puedo copiar mi repo LOCAL  al SERVER(github). 




Fuentes: 

De aquí veo los dos primeros pasos: 

* https://help.github.com/es/github/authenticating-to-github/error-permission-denied-publickey

De aquí veo como generar la llave SSH: 

* https://help.github.com/es/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

De aquí vi como agregar la llave SSH a mi github: 

* https://help.github.com/es/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account

Video que explica los comandos básicos de git y como lo sincroniza con github, pero sin clave SSH. 

* https://www.youtube.com/watch?v=HiXLkL42tMU&t=2109s	
