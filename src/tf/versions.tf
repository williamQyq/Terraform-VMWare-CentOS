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
###############################################################################
# PROVIDER CONFIGURATION
###############################################################################
# The provider block configures the specified provider, in this case VMware vSphere.
# This includes authentication details and connection parameters.
###############################################################################
provider "vsphere" {
  user                 = var.vsphere_user     # vSphere username from variables
  password             = var.vsphere_password # vSphere password from variables
  vsphere_server       = var.vsphere_vcenter  # vCenter server address from variables
  allow_unverified_ssl = true                 # Skip SSL verification (for self-signed certs)
}

