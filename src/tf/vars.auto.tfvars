cpu                    = 8
cores-per-socket       = 1
ram                    = 8192
disksize               = 200 # in GB
vm-guest-id            = "centos7_64Guest"
# vm-guest-id            = "centos9_64Guest"

vsphere-unverified-ssl = "true"

# vsphere-datacenter     = "Office"
vsphere-datacenter     = "QCA-Office"

# vsphere-cluster        = "172.16.101.231"
vsphere-cluster        = "172.16.101.232"

# vm-datastore           = "Platform_Datastore"
vm-datastore           = "QCA-Testbed"

# vm-network             = "_VM Network"
vm-network             = "VM Network"

vm-domain              = "localdomain"
dns_server_list        = ["8.8.8.8", "8.8.4.4"]
ipv4_gateway           = "172.16.101.1"
ipv4_netmask           = "24"
# vsphere-template-folder = "williamqiao_vm_template"
vsphere-template-folder = "willqiao-vm"
vm-template-name       = "centos-willqiao-vm-template"

# Note: The specific VM names and IP addresses are defined in the locals block
# in variables.tf using the for_each configuration
