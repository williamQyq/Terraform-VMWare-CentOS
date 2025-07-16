# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    vsphere = {
      source  = "vmware/vsphere"
      version = "2.14.0"
    }
  }
}


provider "vsphere" {
  alias               = "vsphere242"
  user                 = var.vsphere_user     # vSphere username from variables
  password             = var.vsphere_password # vSphere password from variables
  vsphere_server       = var.vsphere_vcenter  # vCenter server address from variables
  allow_unverified_ssl = true                 # Skip SSL verification (for self-signed certs)
}
