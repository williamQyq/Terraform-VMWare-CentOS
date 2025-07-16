# Terraform + Packer vSphere Automation for Ridgebot Botctl
This module automates the provisioning of virtual machines in vSphere environment using [Packer](https://www.packer.io/) and [Terraform](https://www.terraform.io/).

## Features

- Builds CentOS and Ubuntu VM templates using Packer
- Uses Kickstart and cloud-init for unattended OS setup
- Provisions VMs via Terraform with custom user-data and metadata templates
- Includes post-install scripts for RidgeBot automated deployment
- Support 2 vcenter VM provision

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

# Provision for 242 vSphere
sh staging.sh
```

## Configuration
Modify *.pkrvars.hcl / *.tfvars for environment-specific settings
```bash
#Packer config - $pwd: src/packer_template 
secrets.pkrvars.hcl     #vSphere config
variables.pkrvars.hcl   #Template config
``` 

```bash
#Terraform config - $pwd: src/tf 
vsphere_[240|242].tfvars    #vSphere config
group[240|242].tfvars       #VM config
``` 

## Logs
Packer logs: packer_template/log/

Terraform debug log: tf/log/terraform-debug-log.md

## License
MIT

## Contributor
Yuqing(William) Qiao  
Heran Wang

<!-- Add more contributors as needed -->

## 📅 Last Updated

June 9th - July 16, 2025