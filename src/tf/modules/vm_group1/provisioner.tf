resource "terraform_data" "post_script" {
  depends_on = [vsphere_virtual_machine.vm]
  for_each = vsphere_virtual_machine.vm

  # Pre-install botctl
  provisioner "remote-exec"{
    script = "${path.module}/../../scripts/preinstall_ridgebot.sh"

    connection{
      type     = "ssh"
      user     = "root"
      password = "admin"
      host     = each.value.default_ip_address
    }
  }

  # Waiting for services starting
  provisioner "remote-exec" {
    script = "${path.module}/../../scripts/installing_ridgebot.sh"

    connection {
      type     = "ssh"
      user     = "root"
      password = "PL<okm098...???"
      host     = each.value.default_ip_address
    }
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
