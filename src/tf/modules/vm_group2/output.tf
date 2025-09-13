###############################################################################
# TERRAFORM OUTPUTS
###############################################################################
# Output values are the return values of a Terraform module that can be used
# by other modules or displayed to the user when Terraform applies.
# These outputs provide valuable information about the created resources.
###############################################################################

# Map of IP addresses for all created VMs
output "ip_addresses" {
  description = "IP addresses of all created virtual machines"
  value = {
    for k, v in vsphere_virtual_machine.vm : k => try(v.guest_ip_addresses[0],null)
  }
}

# Map of VM names for all created VMs
output "vm_names" {
  description = "Names of all created virtual machines"
  value = {
    for k, v in vsphere_virtual_machine.vm : k => v.name
  }
}

