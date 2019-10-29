#Execucao com parametros
#$ make ENV="prod"
#conditional:
#ifeq (${ENV},prod)
#	@echo ${ENV}
#endif*/
#Definição dos alvos que não são arquivos
.PHONY: all init fmt validate plan apply destroy

#Definição dos alvos que vão ser executados com o comando make
all: init fmt plan apply

#Definição da variavel
ENV = dev

#target init
init:
	@echo "----------------------------------------"
	@echo "Starting terraform"
	@terraform init

#target fmt
fmt:
	@echo "----------------------------------------"
	@echo "Formatting terraform files"
	@terraform fmt

#target validate
validate:
	@echo "----------------------------------------"
	@echo "Validating terraform files"
	@terraform validate

#target plan
plan:
	@echo "----------------------------------------"
	@echo "Planning..."
	@terraform plan -var-file="${ENV}/terraform.tfvars" -out="plan.tfout"

#target apply
apply:
	@echo "----------------------------------------"
	@echo "Applying..."
	@terraform apply plan.tfout

#target destroy
destroy:
	@echo "----------------------------------------"
	@echo "Destroying..."
	@terraform destroy -var-file="${ENV}/terraform.tfvars" -auto-approve
	@rm -rf .terraform