#===========================#
# VMware vCenter connection #
#===========================#
# These variables are used for authenticating with vCenter Server.
# They are marked as sensitive to prevent their values from being
# displayed in console output or logs.
#===========================#

variable "resource_pool_id" {
  type        = string
  description = "Resource pool ID for the vSphere cluster"

}

variable "datastore_id" {
  type        = string
  description = "Datastore ID for the vSphere cluster"

}

variable "network_id" {
  type        = string
  description = "Network ID for the vSphere cluster"

}
variable "adapter_type" {
  type        = string
  description = "Network adapter type for the VMs"

}

variable "thin_provisioned" {
  type        = bool
  description = "Whether the VM disks should be thin provisioned"

}
variable "eagerly_scrub" {
  type        = bool
  description = "Whether the VM disks should be eagerly scrubbed"

}

variable "template_uuid" {
  type        = string
  description = "UUID of the vSphere template to clone"

}

variable "folder" {
  type        = string
  description = "Folder in vSphere where the VM will be created"
  default     = ""

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
}
variable "rb_version" {
  type        = string
  description = "Version of RidgeBot to install on the VM"
}

variable "rb_tag" {
  type        = string
  description = "Tag for RidgeBot to install on the VM"

}

variable "vm-linked-clone" {
  type        = string
  description = "Use linked clone to create the vSphere virtual machine from the template (true/false). If you would like to use the linked clone feature, your template need to have one and only one snapshot"
  default     = "false"
}

#===========================#
# VM Hardware Configuration #
#===========================#

variable "cpu" {
  description = "Number of vCPU for the vSphere virtual machines (default value, can be overridden per VM in locals)"
  default     = 8
}

variable "cores-per-socket" {
  description = "Number of cores per cpu for workers"
  default     = 1
}

variable "ram" {
  description = "Amount of RAM for the vSphere virtual machines in MB (default value, can be overridden per VM in locals)"
}

variable "disksize" {
  description = "Disk size in GB (default value, can be overridden per VM in locals)"
  default     = 40
}

#===========================#
# VM Operating System       #
#===========================#

variable "vm-guest-id" {
  type        = string
  description = "The ID of virtual machines operating system"
}

variable "vm-domain" {
  type        = string
  description = "Linux virtual machine domain name for the machine. This, along with host_name, make up the FQDN of the virtual machine"
  default     = ""
}

#===========================#
# Network Configuration     #
#===========================#

variable "dns_server_list" {
  type = list(string)
  description = "List of DNS servers"
  default = ["8.8.8.8", "8.8.4.4"]
}

variable "ipv4_gateway" {
  type        = string
  description = "Default gateway for the network"
}

variable "ipv4_netmask" {
  type        = string
  description = "Network mask (e.g., 24 for a /24 network)"
}

#===========================#
# Authentication            #
#===========================#

variable "ssh_username" {
  type        = string
  description = "SSH username for VM access"
  sensitive   = true
  default     = "root"
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
}

