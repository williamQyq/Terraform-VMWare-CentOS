.PHONY: init-staging plan-staging apply-staging destroy-staging

FILE := ../../vsphere_242.tfvars
GROUP := ../../group242.tfvars
PLAN := staging.plan
CHDIR := environments/staging
LOG := ./log/terraform-debug-log.md

init-staging:
	mkdir -p ./log
	terraform -chdir=$(CHDIR) init

plan-staging: init-staging
	terraform -chdir=$(CHDIR) plan \
		-var-file=$(FILE) \
		-var-file=$(GROUP) \
		-out=$(PLAN)

apply-staging: plan-staging
	terraform -chdir=$(CHDIR) apply \
		-var-file=$(FILE) \
		-var-file=$(GROUP) \
		-auto-approve \
		$(PLAN)

destroy-staging:
	terraform -chdir=$(CHDIR) destroy \
		-var-file=$(FILE) \
		-var-file=$(GROUP) \
		-auto-approve
