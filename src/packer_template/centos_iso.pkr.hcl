###############################################################################
# PACKER CONFIGURATION
###############################################################################
# This block configures Packer itself, including required plugins
# The vSphere plugin is needed to build VMs on vSphere infrastructure
###############################################################################
packer {
  required_plugins {
    vsphere = {
      version = ">= v1.2.0"                    # Minimum required version of the vSphere plugin
      source  = "github.com/hashicorp/vsphere" # Source location of the plugin
    }
  }
}

###############################################################################
# AUTHENTICATION VARIABLES
###############################################################################
# These variables define the credentials used to connect to vCenter
# They are marked as sensitive to prevent exposure in logs
###############################################################################

# vCenter Credentials
variable "vcenter_username" {
  type        = string
  description = "The username for authenticating to vCenter."
  default     = ""   # No default, must be specified in variables file
  sensitive   = true # Marked sensitive to hide in logs
}

variable "vcenter_password" {
  type        = string
  description = "The plaintext password for authenticating to vCenter."
  default     = ""   # No default, must be specified in variables file
  sensitive   = true # Marked sensitive to hide in logs
}

variable "ssh_username" {
  type        = string
  description = "The username to use to authenticate over SSH."
  default     = "root" # Default SSH username
  sensitive   = true     # Marked sensitive to hide in logs
}

variable "ssh_password" {
  type        = string
  description = "The plaintext password to use to authenticate over SSH."
  default     = "admin" # Default SSH password
  sensitive   = true     # Marked sensitive to hide in logs
}

###############################################################################
# VSPHERE INFRASTRUCTURE VARIABLES
###############################################################################
# These variables define the vSphere infrastructure components
# where the template VM will be created
###############################################################################

# vSphere Objects
variable "vcenter_insecure_connection" {
  type        = bool
  description = "If true, does not validate the vCenter server's TLS certificate."
  default     = true # Skip SSL verification (useful for self-signed certs)
}

variable "vcenter_server" {
  type        = string
  description = "The fully qualified domain name or IP address of the vCenter Server instance."
  default     = "" # No default, must be specified in variables file
}

variable "vcenter_datacenter" {
  type        = string
  description = "Required if there is more than one datacenter in vCenter."
  default     = "" # No default, must be specified in variables file
}

# variable "vcenter_host" {
#   type        = string
#   description = "The ESXi host where target VM is created."
#   default     = "" # No default, must be specified in variables file
# }

variable "vcenter_cluster" {
  type        = string
  description = "The cluster where target VM is created."
  default     = "" # No default, must be specified in variables file
}

variable "vcenter_datastore" {
  type        = string
  description = "Required for clusters, or if the target host has multiple datastores."
  default     = "" # No default, must be specified in variables file
}

variable "vcenter_network" {
  type        = string
  description = "The network segment or port group name to which the primary virtual network adapter will be connected."
  default     = "" # No default, must be specified in variables file
}

variable "vcenter_folder" {
  type        = string
  description = "The VM folder in which the VM template will be created."
  default     = "" # No default, must be specified in variables file
}

###############################################################################
# ISO INSTALLATION MEDIA VARIABLES
###############################################################################
# These variables define the installation media (ISO) used to install
# the operating system on the template VM
###############################################################################

# ISO Objects
variable "iso_path" {
  type        = string
  description = "The path on the source vSphere datastore for ISO images."
  default     = "" # No default, used when ISO is already on datastore
}

variable "iso_url" {
  type        = string
  description = "The url to retrieve the iso image"
  default     = "https://releases.ubuntu.com/24.04/ubuntu-24.04.2-live-server-amd64.iso" # Default Ubuntu 24.04 ISO URL
}

variable "iso_file" {
  type        = string
  description = "The file name of the guest operating system ISO image installation media."
  default     = "" # No default, used when specifying ISO filename only
}

variable "iso_checksum" {
  type        = string
  description = "The checksum of the ISO image."
  default     = "d6dab0c3a657988501b4bd76f1297c053df710e06e0c3aece60dead24f270b4d" # Default checksum for Ubuntu 24.04.2 ISO
}

variable "iso_checksum_type" {
  type        = string
  description = "The checksum type of the ISO image. Ex: sha256"
  default     = "sha256" # Using SHA256 for checksum verification
}

###############################################################################
# CLOUD-INIT CONFIGURATION
###############################################################################
# This variable defines the location of cloud-init configuration files
# which customize the VM during first boot
###############################################################################

# HTTP Endpoint
variable "http_directory" {
  type        = string
  description = "Directory of config files(user-data, meta-data)."
  default     = "http" # Directory containing cloud-init configs
}

###############################################################################
# VIRTUAL MACHINE CONFIGURATION VARIABLES
###############################################################################
# These variables define the hardware and settings for the VM template
# including CPU, memory, disk, and other hardware parameters
###############################################################################

# Virtual Machine Settings
variable "vm_name" {
  type        = string
  description = "The template vm name"
  default     = "CentOS-9-willqiao-Template" # Default name for the VM template
}

variable "vm_guest_os_type" {
  type        = string
  description = "The guest operating system type, also know as guestid."
  default     = "centOSGuest" # vSphere guestId for Ubuntu 64-bit
}

variable "vm_version" {
  type        = number
  description = "The VM virtual hardware version."
  default     = 19 # VM hardware version 19 (vSphere 7.0+)
}

variable "vm_firmware" {
  type        = string
  description = "The virtual machine firmware. (e.g. 'bios' or 'efi')"
  default     = "efi" # Using EFI firmware for modern boot support
}

variable "vm_cdrom_type" {
  type        = string
  description = "The virtual machine CD-ROM type."
  default     = "sata" # SATA CD-ROM type
}

variable "vm_cpu_sockets" {
  type        = number
  description = "The number of virtual CPUs sockets."
  default     = 1 # 1 CPU socket
}

variable "vm_cpu_cores" {
  type        = number
  description = "The number of virtual CPUs cores per socket."
  default     = 8 # 2 CPU cores per socket (total of 2 vCPUs)
}

variable "vm_mem_size" {
  type        = number
  description = "The size for the virtual memory in MB."
  default     = 32768 # 8GB RAM
}

variable "vm_disk_size" {
  type        = number
  description = "The size for the virtual disk in MB."
  default     = 51200 # 50GB disk size
}

variable "thin_provision" {
  type        = bool
  description = "Thin or Thick provisioning of the disk"
  default     = true # Use thin provisioning to save space
}

variable "disk_eagerly_scrub" {
  type        = bool
  description = "eagrly scrub zeros"
  default     = false # Don't eagerly scrub zeros (faster provisioning)
}

variable "vm_disk_controller_type" {
  type        = list(string)
  description = "The virtual disk controller types in sequence."
  default     = ["pvscsi"] # Use paravirtual SCSI controller (better performance)
}

variable "vm_network_card" {
  type        = string
  description = "The virtual network card type."
  default     = "vmxnet3" # VMXNET3 network adapter (better performance)
}

variable "vm_boot_wait" {
  type        = string
  description = "The time to wait before boot."
  default     = "10s" # Wait 10 seconds before sending boot commands
}

variable "shell_scripts" {
  type        = list(string)
  description = "A list of scripts."
  default     = [] # No default shell scripts
}

variable "rb_version" {
  type        = string
  description = "The RidgeBot version e.g. 5.4.5"
  default     = "" # Wait 10 seconds before sending boot commands
}

variable "rb_tag" {
  type        = string
  description = "The RidgeBot tag version e.g. rb10"
  default     = "" # Wait 10 seconds before sending boot commands
}

variable "server_idc" {
  type        = string
  description = "Ridgebot artifacts file server"
  default     = ""
}

###############################################################################
# LOCALS CONFIGURATION
###############################################################################
# Local variables used within the template
###############################################################################

locals {
  buildtime = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp()) # Format current timestamp for template notes
}

###############################################################################
# SOURCE DEFINITION
###############################################################################
# This block defines the source VM configuration for vSphere
# It includes all the settings for the VM that will be created
###############################################################################

source "vsphere-iso" "centos-rb-prebuild" {
  # vCenter connection settings
  vcenter_server      = var.vcenter_server              # vCenter server address
  username            = var.vcenter_username            # vCenter username
  password            = var.vcenter_password            # vCenter password
  datacenter          = var.vcenter_datacenter          # vCenter datacenter
  datastore           = var.vcenter_datastore           # Datastore for VM files
#   host                = var.vcenter_host                # ESXi host
  cluster             = var.vcenter_cluster             # Cluster name
  folder              = var.vcenter_folder              # VM folder
  insecure_connection = var.vcenter_insecure_connection # Skip SSL verification

  # VM conversion settings
  tools_upgrade_policy = true # Upgrade VMware tools during customization
  remove_cdrom         = true # Remove CD-ROM after build
  convert_to_template  = true # Convert to template after build

  # VM hardware settings
  guest_os_type        = var.vm_guest_os_type                                          # Guest OS type
  vm_version           = var.vm_version                                                # VM hardware version
  notes                = "CentOS Template built by Packer on ${local.buildtime}" # VM notes
  vm_name              = var.vm_name                                                   # VM name
  firmware             = var.vm_firmware                                               # VM firmware type
  CPUs                 = var.vm_cpu_sockets                                            # CPU sockets
  cpu_cores            = var.vm_cpu_cores                                              # CPU cores per socket
  CPU_hot_plug         = false                                                         # Disable CPU hot-plug
  RAM                  = var.vm_mem_size                                               # VM memory
  RAM_hot_plug         = false                                                         # Disable memory hot-plug
  cdrom_type           = var.vm_cdrom_type                                             # CD-ROM type
  disk_controller_type = var.vm_disk_controller_type                                   # Disk controller type

  # Disk configuration
  storage {
    disk_size             = var.vm_disk_size       # Disk size
    disk_controller_index = 0                      # Controller index
    disk_thin_provisioned = var.thin_provision     # Thin provisioning
    disk_eagerly_scrub    = var.disk_eagerly_scrub # Eager zero scrubbing
  }

  # Network configuration
  network_adapters {
    network      = var.vcenter_network # Network name
    network_card = var.vm_network_card # Network card type
  }

  iso_paths =[
    "[Platform_Datastore] Platform_ISO/CentOS-Stream-9-20250224.1-x86_64-dvd1.iso"
  ]

  # Installation media
#   iso_url      = var.iso_url                                    # ISO URL
#   iso_checksum = "${var.iso_checksum_type}:${var.iso_checksum}" # ISO checksum

  # Cloud-init configuration via CD-ROM
  # This creates a secondary CD-ROM with cloud-init data
  cd_files = [
    "./${var.http_directory}/meta-data", # Cloud-init metadata
    "./${var.http_directory}/user-data",  # Cloud-init user data
    "./${var.http_directory}/ks.cfg",  # red hat pre config centos file
  ]
  cd_label = "cidata" # Label for cloud-init CD-ROM

  # Boot configuration
  boot_order = "disk,cdrom"     # Boot order
  boot_wait  = var.vm_boot_wait # Wait time before boot commands

  # These commands trigger the automated installation process
  boot_command = [
#     "<up><up><tab> inst.text inst.ks=cdrom:/ks.cfg <enter><wait>"
    "<esc><wait>",
    "<up><up>",
    "e<down><down><end>",
    " inst.text inst.ks=cdrom:/ks.cfg <enter><wait>",
    "<f10>"
  ]

  # SSH and timeout settings
  ip_wait_timeout        = "40m"                                                     # Time to wait for IP assignment
  ssh_password           = var.ssh_password                                          # SSH password
  ssh_username           = var.ssh_username                                          # SSH username
  ssh_port               = 22                                                        # SSH port
  ssh_timeout            = "50m"                                                     # SSH connection timeout
  ssh_handshake_attempts = "1000"                                                    # SSH handshake attempts
  shutdown_command       = "echo '${var.ssh_password}' | sudo -S -E shutdown -P now" # Shutdown command
  shutdown_timeout       = "50m"                                                     # Shutdown timeout
}
#
# source "vsphere-clone" "centos-rb-postbuild" {
#   # vCenter connection settings
#   vcenter_server      = var.vcenter_server              # vCenter server address
#   username            = var.vcenter_username            # vCenter username
#   password            = var.vcenter_password            # vCenter password
#   datacenter          = var.vcenter_datacenter          # vCenter datacenter
#   datastore           = var.vcenter_datastore           # Datastore for VM files
# #   host                = var.vcenter_host                # ESXi host
#   cluster             = var.vcenter_cluster             # Cluster name
#   folder              = var.vcenter_folder              # VM folder
#   insecure_connection = var.vcenter_insecure_connection # Skip SSL verification
#
#   # VM conversion settings
#   template             = var.vm_name
#   vm_name              = "centos9-rb-from-template"
#   convert_to_template  = true # Convert to template after build
#
#   # SSH and timeout settings
#   ip_wait_timeout        = "40m"                                                     # Time to wait for IP assignment
#   ssh_password           = var.ssh_password_ridgebot                                          # SSH password
#   ssh_username           = var.ssh_username_ridgebot                                          # SSH username
#   ssh_port               = 22                                                        # SSH port
#   ssh_timeout            = "50m"                                                     # SSH connection timeout
#   ssh_handshake_attempts = "1000"                                                    # SSH handshake attempts
#   shutdown_command       = "echo '${var.ssh_password}' | sudo -S -E shutdown -P now" # Shutdown command
#   shutdown_timeout       = "50m"                                                     # Shutdown timeout
# }

###############################################################################
# BUILD CONFIGURATION
###############################################################################
# This block defines the build process, including the source VM
# and provisioners that run scripts to configure the VM
###############################################################################

build {
  # Use the centos9 source defined above
  sources = ["source.vsphere-iso.centos-rb-prebuild"]

  ###############################################################################
  # STAGE 1: POST-INSTALLATION VM TOOLS CONFIGURATION
  ###############################################################################
  # This provisioner waits for cloud-init to finish and configures VMware tools
  provisioner "shell" {
    inline = [

      # Wait for cloud-init to complete
      "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done",
      "echo 'Cloud-init finished...'",

      # Configure VMware tools
      "sudo systemctl enable vmtoolsd.service", # Enable VMware tools on boot
      "sudo systemctl start vmtoolsd.service", # Start VMware tools

      # Remove networking configs that might interfere with template
      "sudo rm -f /etc/netplan/00-installer-config.yaml",

      # Add custom issue message
      "echo 'Centos stream 9 Template by Packer - Creation Date: $(date)' | sudo tee /etc/issue"
    ]
  }

  ###############################################################################
  # STAGE 2: Ridgebot INSTALLATION
  ###############################################################################
  # This provisioner installs Ridgebot with pinned version
  provisioner "shell" {
    script = "scripts/fetch_release_files.sh"
    environment_vars = [
      "VERSION=${var.rb_version}",
      "TAG=${var.rb_tag}",
      "SERVER_IP=${var.server_idc}", #IDC server ip
      "PORT=85"
    ]
    expect_disconnect = true
  }

  ###############################################################################
  # STAGE 3: SYSTEM CLEANUP
  ###############################################################################
  # This provisioner cleans up the system to reduce template size
  provisioner "shell" {
    inline = [
      "echo 'Cleaning up...'",

      # Remove unnecessary packages
      "sudo dnf autoremove -y",

      # Clean package cache
      "sudo dnf clean all",
      "sudo rm -rf /var/cache/dnf",
      "sudo rm -rf /tmp/*",
      "sudo rm -rf /var/tmp/*",
      "sudo journalctl --rotate",
      "sudo journalctl --vacuum-time=1d",
      "sudo rm -rf /var/log/anaconda",  # Optional: if Kickstart was used

    ]
  }

  ###############################################################################
  # STAGE 4: TEMPLATE PREPARATION
  ###############################################################################
  # This provisioner prepares the VM for conversion to a template
  provisioner "shell" {
    inline = [
      "echo 'Preparing for template conversion...'",

      # Reset machine-id to ensure unique ID on clone
      "sudo rm -f /etc/machine-id",
      "sudo truncate -s 0 /etc/machine-id",
#       "sudo rm -f /var/lib/dbus/machine-id",
#       "sudo ln -s /etc/machine-id /var/lib/dbus/machine-id",

      # Remove SSH host keys so they're regenerated on first boot
      "sudo rm -f /etc/ssh/ssh_host_* || true",

      # Configure SSH to regenerate host keys on first boot
      "sudo mkdir -p /etc/systemd/system/ssh.service.d/ || true",
      "echo '[Service]' | sudo tee /etc/systemd/system/ssh.service.d/regenerate_ssh_host_keys.conf || true",
      "echo 'ExecStartPre=/bin/sh -c \"if [ -e /dev/zero ]; then rm -f /etc/ssh/ssh_host_* && ssh-keygen -A; fi\"' | sudo tee -a /etc/systemd/system/ssh.service.d/regenerate_ssh_host_keys.conf || true",

      # Configure faster boot
      "echo 'Setting disk as boot device...'",
      "sudo sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=1/' /etc/default/grub || true",
      "sudo grub2-mkconfig -o /boot/grub2/grub.cfg || sudo grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg || true",

      "echo 'Installation and cleanup completed successfully!'"
    ]
  }
}
