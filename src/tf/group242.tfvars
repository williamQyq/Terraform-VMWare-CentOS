cpu                    = 8
cores-per-socket       = 1
ram                    = 32768
disksize               = 200 # in GB
vm-guest-id            = "centos7_64Guest"

vsphere-unverified-ssl = "true"

vsphere-datacenter     = "QCA-Office"

vsphere-cluster        = "172.16.101.232"

vm-datastore           = "QCA-Testbed"

vm-network             = "VM Network"

vm-domain              = "localdomain"
dns_server_list        = ["8.8.8.8", "8.8.4.4"]
ipv4_gateway           = "172.16.101.1"
ipv4_netmask           = "24"
vsphere-template-folder = "willqiao-vm"

rb_version            = "546" # auto get from gitlab tag, Specify the version of RidgeBot to install
rb_tag              = "rb1" # auto get from gitlab tag, Specify the tag for RidgeBot
vm-name-prefix = "centos9" # Specify Name user and os version

vm-template-name       = "centos-rb-5.4.6-rb1-vm-template"

# Note: The specific VM names and IP addresses are defined in the locals block
# in variables.tf using the for_each configuration
