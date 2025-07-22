#!/bin/bash

packer build -on-error=ask \
    -var-file=secrets.pkrvars.hcl \
    -var-file=variables_ubuntu.pkrvars.hcl \
    -var="vm_name=runner" \
    ubuntu-24-04.pkr.hcl