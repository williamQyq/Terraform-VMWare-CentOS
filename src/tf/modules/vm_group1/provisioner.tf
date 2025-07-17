#================================#
# VM Configuration               #
#================================#
# This locals block defines the specific VMs to create and their
# individual configurations. This is the main place to add or modify VMs.
#================================#

locals {
  # Define multiple VMs with their specific configurations
  vms = {
    "vm1" = {
      name         = "${var.vm-name-prefix}-${var.rb_version}-${var.rb_tag}-vm1" # Name of the first VM
#       ipv4_address = "192.168.1.97"    # Static IP address for the first VM
      cpu          = var.cpu           # Use the default CPU count
      ram          = var.ram           # Use the default RAM amount
      disksize     = var.disksize      # Use the default disk size
    },
    "vm2" = {
      name         = "${var.vm-name-prefix}-${var.rb_version}-${var.rb_tag}-vm2" # Name of the second VM
#       ipv4_address = "192.168.1.98"    # Static IP address for the second VM
      cpu          = var.cpu           # Use the default CPU count
      ram          = var.ram           # Use the default RAM amount
      disksize     = var.disksize      # Use the default disk size
    }
    # Add more VMs as needed by adding more entries to this map
  }

  # Common template variables for all VMs
  # These values are passed to the cloud-init templates for VM customization
  common_templatevars = {
    ipv4_gateway = var.ipv4_gateway,       # Default gateway for all VMs
    dns_server_1 = var.dns_server_list[0], # Primary DNS server
    dns_server_2 = var.dns_server_list[1], # Secondary DNS server
    public_key   = var.public_key,         # SSH public key for authentication
    ssh_username = var.ssh_username        # Init SSH username for the VMs. e.g. root
    ssh_password = var.ssh_password     # Init SSH password for the VMs. e.g. admin
    ssh_username_ridgebot = "root"
    ssh_password_ridgebot = "PL<okm098...???" # Password for RidgeBot root user
  }

  ssh_args = "-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ConnectTimeout=5"
}


resource "terraform_data" "post_script" {
  depends_on = [vsphere_virtual_machine.vm]
  for_each = vsphere_virtual_machine.vm

  # Pre-install botctl
  provisioner "remote-exec"{
    script = "${path.module}/../../scripts/preinstall_ridgebot.sh"

    connection{
      type     = "ssh"
      user     = local.common_templatevars.ssh_username
      password = local.common_templatevars.ssh_password
      host     = each.value.default_ip_address
    }
  }

  # Waiting for services starting
  provisioner "remote-exec" {
    script = "${path.module}/../../scripts/installing_ridgebot.sh"

    connection {
      type     = "ssh"
      user     = local.common_templatevars.ssh_username_ridgebot
      password = local.common_templatevars.ssh_password_ridgebot
      host     = each.value.default_ip_address
    }
  }
  # Reboot and wait for the OS to come back up
  provisioner "local-exec" {
    environment = {
      SSHPASS = local.common_templatevars.ssh_password_ridgebot
    }
    command = <<-EOT
      sshpass -e ssh ${local.ssh_args} root@${each.value.default_ip_address} '(sleep 2; reboot)&'; sleep 3
      until sshpass -e ssh ${local.ssh_args} -o ConnectTimeout=2 root@${each.value.default_ip_address} true 2> /dev/null
      do
        echo "Waiting for OS to reboot and become available..."
        sleep 3
      done
    EOT
  }

  # Login as manager created by botctl for post actions
  provisioner "remote-exec" {
    inline = [
      "echo 'Running follow-up as manager'",
      # Attempt to mimic interactive command if possible
    ]

    connection {
      type     = "ssh"
      user     = "manager"
      password = "admin"
      host     = each.value.default_ip_address
    }
  }
}
