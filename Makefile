#Definição dos alvos que não são arquivos
.PHONY: all init fmt validate plan apply destroy

#Definição dos alvos que vão ser executados com o comando make
all: init fmt plan apply

ENV = dev

init:
	@echo "----------------------------------------"
	@echo "Starting terraform"
	terraform init

fmt:
	@echo "----------------------------------------"
	@echo "Formatting terraform files"
	terraform fmt

validate:
	@echo "----------------------------------------"
	@echo "Validating terraform files"
	terraform validate

plan:
	@echo "----------------------------------------"
	@echo "Planning..."
	terraform plan -var-file="${ENV}/terraform.tfvars" -out="plan.tfout"

apply:
	@echo "----------------------------------------"
	@echo "Applying..."
	terraform apply plan.tfout

destroy:
	@echo "----------------------------------------"
	@echo "Destroying..."
	terraform destroy -var-file="${ENV}/terraform.tfvars" -auto-approve
	rm -rf .terraform