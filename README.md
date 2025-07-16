# Terraform + Packer vSphere Automation for Ridgebot Botctl
This module automates the provisioning of virtual machines in a vSphere environment using [Packer](https://www.packer.io/) and [Terraform](https://www.terraform.io/).

## Features

- Builds CentOS and Ubuntu VM templates using Packer
- Uses Kickstart and cloud-init for unattended OS setup
- Provisions VMs via Terraform with custom user-data and metadata templates
- Includes post-install scripts for RidgeBot automated deployment
- Supports offline installation workflows

## Structure

```bash
terraform-packer-vsphere/
├── packer_template/ # Packer templates and scripts for VM image building
├── tf/ # Terraform modules and scripts for VM provisioning
```

## Getting Started

### 1. Build Template Image with Packer

```bash
cd terraform-packer-vsphere/packer_template  
setup.sh centos_iso.pkr.hcl {RB_VERSION} {RB_TAG} #or use your *.pkr.hcl
```

### 2. Provision VMs with Terraform
```bash
# pwd: terraform-packer-vsphere/tf/

terraform init
terraform plan -out=tfplan && terraform apply -auto-approve tfplan
```

## Configuration
Modify variables.pkrvars.hcl / terraform.tfvars for environment-specific settings

> ⚠️ **Secrets:** Secrets and credentials should go into secrets.pkrvars.hcl (not committed)**

## Logs
Packer logs: packer_template/log/

Terraform debug log: tf/log/terraform-debug-log.md

## License
MIT

<!-- Add more contributors as needed -->

## 📅 Last Updated

June 9th - July 11, 2025