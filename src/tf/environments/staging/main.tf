###############################################################################
# DATA SOURCES
###############################################################################
# Data sources allow Terraform to read attributes from existing infrastructure.
# Here we're getting information about vSphere objects we need for our VMs.
###############################################################################

# Get information about the datacenter
data "vsphere_datacenter" "dc" {
  provider = vsphere.vsphere242 # Use the vSphere provider configured above
  name = var.vsphere-datacenter # The name of the datacenter in vSphere
}

# Get information about the datastore where VMs will be stored
data "vsphere_datastore" "datastore" {
  provider      = vsphere.vsphere242
  name = var.vm-datastore              # The name of the datastore
  datacenter_id = data.vsphere_datacenter.dc.id # Reference to the datacenter above
}

# Get information about the compute cluster where VMs will run
data "vsphere_host" "host" {
  provider      = vsphere.vsphere242
  name = var.vsphere-cluster           # The name of the cluster
  datacenter_id = data.vsphere_datacenter.dc.id # Reference to the datacenter above
}

# Get information about the network where VMs will be connected
data "vsphere_network" "network" {
  provider      = vsphere.vsphere242
  name = var.vm-network                # The name of the network
  datacenter_id = data.vsphere_datacenter.dc.id # Reference to the datacenter above
}

# Get information about the template that will be used to create VMs
data "vsphere_virtual_machine" "template" {
  provider      = vsphere.vsphere242
  name          = "centos-rb-${var.rb_version}-${var.rb_tag}-vm-template"
  datacenter_id = data.vsphere_datacenter.dc.id # Reference to the datacenter above
}
###############################################################################
# VIRTUAL MACHINE RESOURCE
###############################################################################
module "vm_group1" {
  source = "../../modules/vm_group1" # Path to the module containing VM definitions

  providers = {
    vsphere = vsphere.vsphere242 # Use the vSphere provider configured above
  }

  resource_pool_id = data.vsphere_host.host.resource_pool_id # Use the resource pool from the host data source
  datastore_id = data.vsphere_datastore.datastore.id                   # Datastore for VM files

  # VM configuration variables
  thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned # Same provisioning as template
  eagerly_scrub = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub    # Same scrubbing as template
  cores-per-socket = var.cores-per-socket
  vm-guest-id      = var.vm-guest-id      # Guest OS identifier

  # Network configuration
  network_id = data.vsphere_network.network.id                                  # Network from data source
  adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0] # Same adapter type as template
  ipv4_gateway = var.ipv4_gateway # Gateway for the network
  dns_server_list = var.dns_server_list
  ipv4_netmask    = var.ipv4_netmask # Netmask for the network

  # Template configuration
  template_uuid = data.vsphere_virtual_machine.template.id # Template UUID from data source
  folder = "/${var.vsphere-datacenter}/vm/${var.vsphere-template-folder}/" # The template folder

  # Hardware configuration
  ram = var.ram # RAM amount for the VMs
  cpu = var.cpu # CPU count for the VMs
  disksize = var.disksize # Disk size for the VMs

  ssh_username = var.ssh_username # SSH username for the VMs
  ssh_password = var.ssh_password # SSH password for the VMs
  public_key = var.public_key # SSH public key for the VMs

  rb_version = var.rb_version # Version of RidgeBot to install
  rb_tag = var.rb_tag # Tag for RidgeBot
  vm-name-prefix = "${var.vm-name-prefix}" # Prefix for VM names

}

output "vm_group1_ips" {
  value = module.vm_group1.ip_addresses # Outputs the IP addresses of the VMs created in this module
}
output "vm_group1_names" {
  value = module.vm_group1.vm_names # Outputs the names of the VMs created in this module
}

###############################################################################
# SECOND VM GROUP (2 VMs, 8 cores-per-socket)
###############################################################################
module "vm_group2" {
  source = "../../modules/vm_group2"

  providers = {
    vsphere = vsphere.vsphere242
  }

  resource_pool_id = data.vsphere_host.host.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
  cores-per-socket = 8
  vm-guest-id      = var.vm-guest-id

  network_id      = data.vsphere_network.network.id
  adapter_type    = data.vsphere_virtual_machine.template.network_interface_types[0]
  ipv4_gateway    = var.ipv4_gateway
  dns_server_list = var.dns_server_list
  ipv4_netmask    = var.ipv4_netmask

  template_uuid = data.vsphere_virtual_machine.template.id
  folder        = "/${var.vsphere-datacenter}/vm/${var.vsphere-template-folder}/"

  ram      = var.ram
  cpu      = var.cpu
  disksize = var.disksize

  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  public_key   = var.public_key

  rb_version     = var.rb_version
  rb_tag         = var.rb_tag
  vm-name-prefix = "${var.vm-name-prefix}-g2"
}

output "vm_group2_ips" {
  value = module.vm_group2.ip_addresses
}

output "vm_group2_names" {
  value = module.vm_group2.vm_names
}
