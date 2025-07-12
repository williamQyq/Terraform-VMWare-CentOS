resource "terraform_data" "post_script" {
  depends_on = [vsphere_virtual_machine.vm]
  for_each = vsphere_virtual_machine.vm

  # Upload script as root, reuse botctl install script on remote vms if possible
  provisioner "file" {
    source      = "${path.module}/scripts/service_botctl_offline_install.sh"
    destination = "/opt/service_botctl_offline_install.sh"

    connection {
      type     = "ssh"
      user     = "root"
      password = "admin"
      host     = each.value.default_ip_address
    }
  }

  # Execute pre-install script as root
  provisioner "remote-exec" {
    script = "${path.module}/scripts/preinstall_ridgebot.sh"

    connection {
      type     = "ssh"
      user     = "root"
      password = "admin"
      host     = each.value.default_ip_address
#       host     = vsphere_virtual_machine.vm["vm1"].default_ip_address
    }
  }

  # Installing, root user recreated, waiting for starting services
  provisioner "remote-exec" {
    script = "${path.module}/scripts/installing_ridgebot.sh"

    connection {
      type     = "ssh"
      user     = "root"
      password = "PL<okm098...???"
      host     = each.value.default_ip_address
#       host     = vsphere_virtual_machine.vm["vm1"].default_ip_address
    }
  }
  #TODO: connect botctl repo manager add reboot after finish installation

  # Login as manager created by botctl for post actions
#   provisioner "remote-exec" {
#     inline = [
#       "echo 'Running follow-up as manager'",
#       # Attempt to mimic interactive command if possible
#     ]
#
#     connection {
#       type     = "ssh"
#       user     = "manager"
#       password = "admin"
#       host     = each.value.default_ip_address
#     }
#   }
}
