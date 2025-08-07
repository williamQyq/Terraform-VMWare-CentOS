.PHONY: init-staging plan-staging apply-staging destroy-staging

FILE := ../../vsphere_242.tfvars
GROUP := ../../group242.tfvars
PLAN := staging.plan
CHDIR := environments/staging
LOG := ./log/terraform-debug-log.md

init-staging:
	mkdir -p ./log
	@TF_STATE_NAME=default terraform -chdir=$(CHDIR) init -reconfigure \
		-backend-config="address=https://gitt.ridgesecurity.ai/api/v4/projects/61/terraform/state/$TF_STATE_NAME" \
		-backend-config="lock_address=https://gitt.ridgesecurity.ai/api/v4/projects/61/terraform/state/$TF_STATE_NAME/lock" \
		-backend-config="unlock_address=https://gitt.ridgesecurity.ai/api/v4/projects/61/terraform/state/$TF_STATE_NAME/lock" \
		-backend-config="username=gitlab-ci-token" \
		-backend-config="password=$${TF_HTTP_PASSWORD}" \
		-backend-config="lock_method=POST" \
		-backend-config="unlock_method=DELETE" \
		-backend-config="retry_wait_min=5"

plan-staging: init-staging
	terraform -chdir=$(CHDIR) plan \
		-var-file=$(FILE) \
		-var-file=$(GROUP) \
		-var="rb_version=$(RB_VERSION)" \
		-var="rb_tag=$(RB_TAG)" \
		-out=$(PLAN)

apply-staging: plan-staging
	terraform -chdir=$(CHDIR) apply \
		-var-file=$(FILE) \
		-var-file=$(GROUP) \
		-var="rb_version=$(RB_VERSION)" \
		-var="rb_tag=$(RB_TAG)" \
		-auto-approve \
		$(PLAN)

destroy-staging:
	terraform -chdir=$(CHDIR) destroy \
		-var-file=$(FILE) \
		-var-file=$(GROUP) \
		-var="rb_version=$(RB_VERSION)" \
		-var="rb_tag=$(RB_TAG)" \
		-auto-approve

output-ip-staging:
	terraform -chdir=$(CHDIR) output -json vm_group1_ips | jq -r '.[]'