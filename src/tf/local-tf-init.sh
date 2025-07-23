#!bin/bash

export GITLAB_ACCESS_TOKEN="glpat-eiG9xk7Tuz_D8avMeUXv"
export TF_HTTP_PASSWORD=$GITLAB_ACCESS_TOKEN
terraform -chdir=environments/staging/ init \
    -backend-config="address=https://gitt.ridgesecurity.ai/api/v4/projects/61/terraform/state/default" \
    -backend-config="lock_address=https://gitt.ridgesecurity.ai/api/v4/projects/61/terraform/state/default/lock" \
    -backend-config="unlock_address=https://gitt.ridgesecurity.ai/api/v4/projects/61/terraform/state/default/lock" \
    -backend-config="username=" \
    -backend-config="password=$GITLAB_ACCESS_TOKEN" \
    -backend-config="lock_method=POST" \
    -backend-config="unlock_method=DELETE" \
    -backend-config="retry_wait_min=5"

