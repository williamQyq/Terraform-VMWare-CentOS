cpu                    = 8
cores-per-socket       = 1
ram                    = 32768
disksize               = 200 # in GB
vm-guest-id            = "centos9_64Guest"

vsphere-unverified-ssl = "true"

vsphere-datacenter     = "Office"

vsphere-cluster        = "172.16.101.231"

vm-datastore           = "Platform_Datastore"

vm-network             = "_VM Network"

vm-domain              = "localdomain"
dns_server_list        = ["8.8.8.8", "8.8.4.4"]
ipv4_gateway           = "172.16.101.1"
ipv4_netmask           = "24"
vsphere-template-folder = "williamqiao_vm_template"

# rb_version            = "latest" # Specify the version of RidgeBot to install
# rb_tag              = "latest" # Specify the tag for RidgeBot
# Note: The specific VM names and IP addresses are defined in the locals block
# in variables.tf using the for_each configuration
