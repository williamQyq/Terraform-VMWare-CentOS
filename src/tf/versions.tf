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
