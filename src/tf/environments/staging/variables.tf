#===========================#
# VMware vCenter connection #
#===========================#
# These variables are used for authenticating with vCenter Server.
# They are marked as sensitive to prevent their values from being
# displayed in console output or logs.
#===========================#

variable "vsphere_user" {
  type        = string
  description = "VMware vSphere user name"
  sensitive   = true # Marked sensitive to hide in logs and console output
}

variable "vsphere_password" {
  type        = string
  description = "VMware vSphere password"
  sensitive   = true # Marked sensitive to hide in logs and console output
}

variable "vsphere_vcenter" {
  type        = string
  description = "VMWare vCenter server FQDN / IP"
  sensitive   = true # Marked sensitive to hide in logs and console output
}

variable "vsphere-unverified-ssl" {
  type        = string
  description = "Is the VMware vCenter using a self signed certificate (true/false)"
  # Set to 'true' if using self-signed certificates in vCenter
}

#===========================#
# vSphere Infrastructure    #
#===========================#
# These variables define the existing vSphere infrastructure components
# where VMs will be deployed, such as datacenter, cluster, and template folder.
#===========================#

variable "vsphere-datacenter" {
  type        = string
  description = "VMWare vSphere datacenter"
  # The name of the datacenter in vSphere where VMs will be deployed
}

variable "vsphere-cluster" {
  type        = string
  description = "VMWare vSphere cluster"
  default     = ""
  # The name of the cluster within the datacenter where VMs will be deployed
}

variable "vsphere-template-folder" {
  type        = string
  description = "Template folder"
  default     = "Templates"
  # The folder where VM templates are stored in vSphere
}

#================================#
# VMware vSphere virtual machine #
#================================#
# These variables define the configuration for the virtual machines
# that will be created. Default values are provided where appropriate.
#================================#

# Note: The VM names and IP addresses are now defined in the locals block at the end of this file

variable "vm-name-prefix" {
  type        = string
  description = "Name of VM prefix (for use in display names, not used with for_each implementation)"
  default     = "centos9"
  # This prefix is used for naming VMs in traditional deployments (not used with for_each)
}

variable "vm-datastore" {
  type        = string
  description = "Datastore used for the vSphere virtual machines"
  # The datastore where VM files will be stored
}

variable "vm-network" {
  type        = string
  description = "Network used for the vSphere virtual machines"
  # The network to which VMs will be connected
}

variable "vm-linked-clone" {
  type        = string
  description = "Use linked clone to create the vSphere virtual machine from the template (true/false). If you would like to use the linked clone feature, your template need to have one and only one snapshot"
  default     = "false"
  # Linked clones use less disk space but require a snapshot on the template
}

#===========================#
# VM Hardware Configuration #
#===========================#
# These variables define the hardware resources allocated to the VMs.
# They serve as defaults and can be overridden in the VM-specific
# configuration in the locals block.
#===========================#

variable "cpu" {
  description = "Number of vCPU for the vSphere virtual machines (default value, can be overridden per VM in locals)"
  default     = 8
  # The number of virtual CPUs allocated to each VM
}

variable "cores-per-socket" {
  description = "Number of cores per cpu for workers"
  default     = 1
  # How many cores per socket (affects performance and licensing)
}

variable "ram" {
  description = "Amount of RAM for the vSphere virtual machines in MB (default value, can be overridden per VM in locals)"
  # The amount of memory allocated to each VM in megabytes
}

variable "disksize" {
  description = "Disk size in GB (default value, can be overridden per VM in locals)"
  default     = 200
  # The size of the primary disk in gigabytes
}

#===========================#
# VM Operating System       #
#===========================#
# These variables define the operating system and networking configuration
# for the VMs being deployed.
#===========================#

variable "vm-guest-id" {
  type        = string
  description = "The ID of virtual machines operating system"
  # The vSphere guest ID that identifies the operating system (e.g., "ubuntu64Guest")
}

variable "rb_version" {
  type        = string
  description = "The version of RidgeBot to install"
  default     = "v@latest"
  # The version of RidgeBot to be installed on the VMs
}
variable "rb_tag" {
  type        = string
  description = "The tag for RidgeBot"
  default     = "rb-latest"
  # The tag for RidgeBot to be installed on the VMs
}

variable "vm-domain" {
  type        = string
  description = "Linux virtual machine domain name for the machine. This, along with host_name, make up the FQDN of the virtual machine"
  default     = ""
  # The DNS domain name for the VMs
}

#===========================#
# Network Configuration     #
#===========================#
# These variables define the network settings for the VMs,
# including DNS servers, gateway, and netmask.
#===========================#

variable "dns_server_list" {
  type        = list(string)
  description = "List of DNS servers"
  default     = ["8.8.8.8", "8.8.4.4"]
  # List of DNS servers the VMs will use
}

variable "ipv4_gateway" {
  type        = string
  description = "Default gateway for the network"
  # The default gateway IP address for the network
}

variable "ipv4_netmask" {
  type        = string
  description = "Network mask (e.g., 24 for a /24 network)"
  # The network mask in CIDR notation (e.g., 24 for a /24 network)
}

#===========================#
# Authentication            #
#===========================#
# These variables define how users will authenticate to the VMs.
# SSH keys are the primary method of authentication.
#===========================#

variable "ssh_username" {
  type        = string
  description = "SSH username for VM access"
  sensitive   = true
  default     = "manager"
  # The username that will be created on the VMs and used for SSH access
}
variable "ssh_password" {
  type        = string
  description = "SSH password for VM access"
  sensitive   = true
  default     = "admin"
}
variable "public_key" {
  type        = string
  description = "Public key to be used to ssh into a machine"
  default     = ""
  # The SSH public key that will be added to authorized_keys on the VMs
}
