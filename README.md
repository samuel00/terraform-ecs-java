# terraform-ecs-java

* Versão do Terraform: v0.12.10
* Necessário conta na AWS    
* Necessário configurar AWS CLI
* Ao final do processo é gerado um arquivo link_app.txt na raiz do projeto que tem o link para acessar a aplicação java
* Os diagramas contendo a arquitetura do projeto estão na pasta images/


## Execução da Infra

1. Subindo a aplicação:

		# Executando Makefile
		$ make
		
1. Destruindo a aplicação:

		# Executando Makefile
		$ make destroy