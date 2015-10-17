# labbd-machine
Máquina virtual para a disciplina de Laboratório de Banco de Dados da UFMS

# Pré-requisitos

- Caso use Windows
	- Git para windows: [Download](https://git-scm.com/download/win)
	- Vagrant: [Guia de instalação](https://www.vagrantup.com/downloads.html)
	- Virtualbox [Download](https://www.virtualbox.org/wiki/Downloads)
- Caso use Linux
	- Vagrant: ```sudo apt-get install vagrant```
	- Virtualbox  ```sudo apt-get install virtualbox```

# Variáveis e usuários dos SGBDs

- Mysql:
	- **username**: root
	- **password**: root
- PostgreSQL:
	- **username**: postgres
	- **password**: root

# Instanciação da máquina virtual

- Copie e cole os arquivos Vagrantfile e boot.sh para uma pasta de sua escolha.
- Se usar Windows:
	- Abra o Git bash
	- Navegue até a pasta onde você colocou os arquivos e execute o seguinte comando:

	```
	vagrant up
	```

	- Espere o processo finalizar e então acesse em seu navegador o endereço para o uso do PHPMyAdmin:

	```
	127.0.0.1:8080/phpmyadmin
	```

	- Espere o processo finalizar e então acesse em seu navegador o endereço para o uso do PHPPgAdmin:

	```
	127.0.0.1:8080/phppgadmin
	```

	- Para desligar a máquina execute o comando:

	```
	vagrant halt
	```
