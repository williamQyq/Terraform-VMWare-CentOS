###############################################################################
# VIRTUAL MACHINE RESOURCE
###############################################################################
# This resource block creates multiple virtual machines based on the VMs defined
# in the locals block in variables.tf. Using for_each allows us to create
# multiple VMs in parallel with different configurations.
###############################################################################
resource "vsphere_virtual_machine" "vm" {
  # Create one VM for each entry in the local.vms map
  for_each = local.vms

  # Basic VM settings
  name             = each.value.name                                       # Name from the VM configuration
  resource_pool_id = var.resource_pool_id # Cluster resource pool
  datastore_id     = var.datastore_id                   # Datastore for VM files

  # Hardware configuration
  num_cpus             = each.value.cpu       # CPU count from VM configuration
  num_cores_per_socket = var.cores-per-socket # Cores per socket from variables
  memory               = each.value.ram       # RAM amount from VM configuration
  guest_id             = var.vm-guest-id      # Guest OS identifier

  # Network configuration - each VM gets one network adapter
  network_interface {
    network_id   = var.network_id                                  # Network from data source
    adapter_type = var.adapter_type # Same adapter type as template
  }

  # Disk configuration - each VM gets one disk
  disk {
    label            = "${each.value.name}-disk"                                      # Disk label based on VM name
    thin_provisioned = var.thin_provisioned # Same provisioning as template
    eagerly_scrub    = var.eagerly_scrub    # Same scrubbing as template
    size             = each.value.disksize                                            # Disk size from VM configuration
  }

  # Clone from template
  clone {
    template_uuid = var.template_uuid # Template UUID from data source

    # customize{
    #   linux_options {
    #     host_name = each.value.name # Hostname for the VM
    #     domain = var.vm-domain # Domain for the VM
    #   }
    #   # use dhcp for network configuration
    #   network_interface {        
    #   }
    # }
  }

  # Cloud-init configuration for first-boot customization
  # This passes metadata and user-data to the VM, encoded in base64
  extra_config = {
    # Metadata includes network configuration and hostname
    "guestinfo.metadata" = base64encode(templatefile("${path.root}/templates/metadata.yaml", merge(local.common_templatevars, {
      name         = each.value.name,
#       ipv4_address = each.value.ipv4_address
    })))
    "guestinfo.metadata.encoding" = "base64"

    # User-data includes SSH keys and packages to install
    "guestinfo.userdata" = base64encode(templatefile("${path.root}/templates/userdata.yaml", merge(local.common_templatevars, {
      name = each.value.name
    })))
    "guestinfo.userdata.encoding" = "base64"
  }
  folder = var.folder # The template folder where the VM will be created

  # Lifecycle configuration to prevent unnecessary changes
  lifecycle {
    ignore_changes = [
      annotation,                                # Don't update if annotation changes
      clone[0].template_uuid,                    # Don't recreate if template UUID changes
      clone[0].customize[0].dns_server_list,     # Don't recreate if DNS servers change
      clone[0].customize[0].network_interface[0] # Don't recreate if network config changes
    ]
  }

  # Firmware configuration
  firmware                = "efi" # Use EFI firmware instead of BIOS
  efi_secure_boot_enabled = false # Disable secure boot for compatibility
}
