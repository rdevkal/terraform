
##
# INTERNAL VARIABLES
##
# Read all subsquent tasks as arguments of the first task
RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(args) $(RUN_ARGS):;@:)
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
landscape   := $(shell command -v landscape 2> /dev/null)
terraform   := $(shell command -v terraform 2> /dev/null)
debug       :=



.PHONY: apply
dev-apply: ## Apply it on Dev Environment
	#
	@terraform init 
	@terraform apply -auto-approve -var-file=dev.tfvars

.PHONY: destroy
dev-destroy: ## Destroy DEV Environment
	@terraform init 
	@terraform destroy -auto-approve -var-file=dev.tfvars

help:
	@printf "\033[32mTerraform-makefile v$(version)\033[0m\n\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help