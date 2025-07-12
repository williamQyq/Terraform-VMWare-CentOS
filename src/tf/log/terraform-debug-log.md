2025-07-10T13:44:43.343-0700 [INFO]  Terraform version: 1.12.2
2025-07-10T13:44:43.343-0700 [DEBUG] using github.com/hashicorp/go-tfe v1.74.1
2025-07-10T13:44:43.343-0700 [DEBUG] using github.com/hashicorp/hcl/v2 v2.23.1-0.20250203194505-ba0759438da2
2025-07-10T13:44:43.343-0700 [DEBUG] using github.com/hashicorp/terraform-svchost v0.1.1
2025-07-10T13:44:43.343-0700 [DEBUG] using github.com/zclconf/go-cty v1.16.2
2025-07-10T13:44:43.343-0700 [INFO]  Go runtime version: go1.24.2
2025-07-10T13:44:43.343-0700 [INFO]  CLI args: []string{"terraform", "apply", "tfplan"}
2025-07-10T13:44:43.343-0700 [DEBUG] Attempting to open CLI config file: /Users/williamqiao/.terraformrc
2025-07-10T13:44:43.343-0700 [DEBUG] File doesn't exist, but doesn't need to. Ignoring.
2025-07-10T13:44:43.344-0700 [DEBUG] ignoring non-existing provider search directory terraform.d/plugins
2025-07-10T13:44:43.344-0700 [DEBUG] ignoring non-existing provider search directory /Users/williamqiao/.terraform.d/plugins
2025-07-10T13:44:43.344-0700 [DEBUG] ignoring non-existing provider search directory /Users/williamqiao/Library/Application Support/io.terraform/plugins
2025-07-10T13:44:43.344-0700 [DEBUG] ignoring non-existing provider search directory /Library/Application Support/io.terraform/plugins
2025-07-10T13:44:43.345-0700 [INFO]  CLI command args: []string{"apply", "tfplan"}
2025-07-10T13:44:43.385-0700 [DEBUG] checking for provisioner in "."
2025-07-10T13:44:43.386-0700 [DEBUG] checking for provisioner in "/opt/homebrew/bin"
2025-07-10T13:44:43.389-0700 [INFO]  backend/local: starting Apply operation
2025-07-10T13:44:43.402-0700 [DEBUG] created provider logger: level=debug
2025-07-10T13:44:43.402-0700 [INFO]  provider: configuring client automatic mTLS
2025-07-10T13:44:43.409-0700 [DEBUG] provider: starting plugin: path=.terraform/providers/registry.terraform.io/vmware/vsphere/2.14.0/darwin_arm64/terraform-provider-vsphere_v2.14.0 args=[".terraform/providers/registry.terraform.io/vmware/vsphere/2.14.0/darwin_arm64/terraform-provider-vsphere_v2.14.0"]
2025-07-10T13:44:43.411-0700 [DEBUG] provider: plugin started: path=.terraform/providers/registry.terraform.io/vmware/vsphere/2.14.0/darwin_arm64/terraform-provider-vsphere_v2.14.0 pid=47853
2025-07-10T13:44:43.412-0700 [DEBUG] provider: waiting for RPC address: plugin=.terraform/providers/registry.terraform.io/vmware/vsphere/2.14.0/darwin_arm64/terraform-provider-vsphere_v2.14.0
2025-07-10T13:44:43.430-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: configuring server automatic mTLS: timestamp=2025-07-10T13:44:43.429-0700
2025-07-10T13:44:43.437-0700 [DEBUG] provider: using plugin: version=5
2025-07-10T13:44:43.438-0700 [DEBUG] provider.terraform-provider-vsphere_v2.14.0: plugin address: network=unix address=/var/folders/y9/lntq3k714r19b0v6jtr9z5sw0000gn/T/plugin3017817120 timestamp=2025-07-10T13:44:43.437-0700
2025-07-10T13:44:43.459-0700 [DEBUG] provider.stdio: received EOF, stopping recv loop: err="rpc error: code = Unavailable desc = error reading from server: EOF"
2025-07-10T13:44:43.460-0700 [INFO]  provider: plugin process exited: plugin=.terraform/providers/registry.terraform.io/vmware/vsphere/2.14.0/darwin_arm64/terraform-provider-vsphere_v2.14.0 id=47853
2025-07-10T13:44:43.460-0700 [DEBUG] provider: plugin exited
2025-07-10T13:44:43.461-0700 [INFO]  backend/local: apply calling Apply
2025-07-10T13:44:43.461-0700 [DEBUG] Building and walking apply graph for NormalMode plan
2025-07-10T13:44:43.463-0700 [DEBUG] Resource state not found for node "vsphere_virtual_machine.vm[\"vm2\"]", instance vsphere_virtual_machine.vm["vm2"]
2025-07-10T13:44:43.463-0700 [DEBUG] Resource state not found for node "terraform_data.post_script[\"vm1\"]", instance terraform_data.post_script["vm1"]
2025-07-10T13:44:43.463-0700 [DEBUG] Resource state not found for node "terraform_data.post_script[\"vm2\"]", instance terraform_data.post_script["vm2"]
2025-07-10T13:44:43.463-0700 [DEBUG] Resource state not found for node "vsphere_virtual_machine.vm[\"vm1\"]", instance vsphere_virtual_machine.vm["vm1"]
2025-07-10T13:44:43.464-0700 [DEBUG] adding implicit provider configuration provider["terraform.io/builtin/terraform"], implied first by terraform_data.post_script (expand)
2025-07-10T13:44:43.465-0700 [DEBUG] ProviderTransformer: "vsphere_virtual_machine.vm[\"vm1\"]" (*terraform.NodeApplyableResourceInstance) needs provider["registry.terraform.io/vmware/vsphere"]
2025-07-10T13:44:43.465-0700 [DEBUG] ProviderTransformer: "data.vsphere_network.network (expand)" (*terraform.nodeExpandApplyableResource) needs provider["registry.terraform.io/vmware/vsphere"]
2025-07-10T13:44:43.465-0700 [DEBUG] ProviderTransformer: "data.vsphere_datacenter.dc (expand)" (*terraform.nodeExpandApplyableResource) needs provider["registry.terraform.io/vmware/vsphere"]
2025-07-10T13:44:43.465-0700 [DEBUG] ProviderTransformer: "data.vsphere_datastore.datastore (expand)" (*terraform.nodeExpandApplyableResource) needs provider["registry.terraform.io/vmware/vsphere"]
2025-07-10T13:44:43.465-0700 [DEBUG] ProviderTransformer: "data.vsphere_virtual_machine.template (expand)" (*terraform.nodeExpandApplyableResource) needs provider["registry.terraform.io/vmware/vsphere"]
2025-07-10T13:44:43.465-0700 [DEBUG] ProviderTransformer: "data.vsphere_host.host (expand)" (*terraform.nodeExpandApplyableResource) needs provider["registry.terraform.io/vmware/vsphere"]
2025-07-10T13:44:43.465-0700 [DEBUG] ProviderTransformer: "vsphere_virtual_machine.vm (expand)" (*terraform.nodeExpandApplyableResource) needs provider["registry.terraform.io/vmware/vsphere"]
2025-07-10T13:44:43.465-0700 [DEBUG] ProviderTransformer: "terraform_data.post_script (expand)" (*terraform.nodeExpandApplyableResource) needs provider["terraform.io/builtin/terraform"]
2025-07-10T13:44:43.465-0700 [DEBUG] ProviderTransformer: "vsphere_virtual_machine.vm[\"vm2\"]" (*terraform.NodeApplyableResourceInstance) needs provider["registry.terraform.io/vmware/vsphere"]
2025-07-10T13:44:43.465-0700 [DEBUG] ProviderTransformer: "terraform_data.post_script[\"vm1\"]" (*terraform.NodeApplyableResourceInstance) needs provider["terraform.io/builtin/terraform"]
2025-07-10T13:44:43.465-0700 [DEBUG] ProviderTransformer: "terraform_data.post_script[\"vm2\"]" (*terraform.NodeApplyableResourceInstance) needs provider["terraform.io/builtin/terraform"]
2025-07-10T13:44:43.465-0700 [ERROR] AttachSchemaTransformer: No provider config schema available for provider["terraform.io/builtin/terraform"]
2025-07-10T13:44:43.465-0700 [DEBUG] ReferenceTransformer: "var.vm-datastore" references: []
2025-07-10T13:44:43.465-0700 [DEBUG] ReferenceTransformer: "var.vsphere-datacenter" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "local.vms (expand)" references: [var.cpu var.ram var.disksize var.cpu var.ram var.disksize]
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "provider[\"terraform.io/builtin/terraform\"]" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.vm-network" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "vsphere_virtual_machine.vm (expand)" references: [local.vms (expand) var.vsphere-datacenter var.vsphere-template-folder var.cores-per-socket var.vm-guest-id data.vsphere_datastore.datastore (expand) data.vsphere_host.host (expand) local.common_templatevars (expand) local.common_templatevars (expand) data.vsphere_network.network (expand) data.vsphere_virtual_machine.template (expand) data.vsphere_virtual_machine.template (expand) data.vsphere_virtual_machine.template (expand) data.vsphere_virtual_machine.template (expand)]
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "terraform_data.post_script (expand)" references: [vsphere_virtual_machine.vm (expand) vsphere_virtual_machine.vm["vm2"] vsphere_virtual_machine.vm["vm1"] vsphere_virtual_machine.vm (expand) vsphere_virtual_machine.vm["vm2"] vsphere_virtual_machine.vm["vm1"]]
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "data.vsphere_network.network (expand)" references: [var.vm-network data.vsphere_datacenter.dc (expand)]
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.vsphere_user" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "local.common_templatevars (expand)" references: [var.ipv4_gateway var.dns_server_list var.dns_server_list var.public_key var.ssh_username var.ssh_password]
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "output.ip_addresses (expand)" references: [vsphere_virtual_machine.vm (expand) vsphere_virtual_machine.vm["vm2"] vsphere_virtual_machine.vm["vm1"]]
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.cpu" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "vsphere_virtual_machine.vm[\"vm2\"]" references: [local.vms (expand) var.vsphere-datacenter var.vsphere-template-folder data.vsphere_datastore.datastore (expand) data.vsphere_host.host (expand) var.cores-per-socket local.common_templatevars (expand) local.common_templatevars (expand) var.vm-guest-id data.vsphere_network.network (expand) data.vsphere_virtual_machine.template (expand) data.vsphere_virtual_machine.template (expand) data.vsphere_virtual_machine.template (expand) data.vsphere_virtual_machine.template (expand)]
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "terraform_data.post_script[\"vm1\"]" references: [vsphere_virtual_machine.vm (expand) vsphere_virtual_machine.vm["vm2"] vsphere_virtual_machine.vm["vm1"] vsphere_virtual_machine.vm (expand) vsphere_virtual_machine.vm["vm2"] vsphere_virtual_machine.vm["vm1"]]
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "provider[\"registry.terraform.io/vmware/vsphere\"]" references: [var.vsphere_vcenter var.vsphere_user var.vsphere_password]
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.cores-per-socket" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.vm-guest-id" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.vm-linked-clone" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.public_key" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "data.vsphere_datacenter.dc (expand)" references: [var.vsphere-datacenter]
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.vsphere-cluster" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "terraform_data.post_script[\"vm2\"]" references: [vsphere_virtual_machine.vm (expand) vsphere_virtual_machine.vm["vm2"] vsphere_virtual_machine.vm["vm1"] vsphere_virtual_machine.vm (expand) vsphere_virtual_machine.vm["vm2"] vsphere_virtual_machine.vm["vm1"]]
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.vm-domain" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "data.vsphere_datastore.datastore (expand)" references: [var.vm-datastore data.vsphere_datacenter.dc (expand)]
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.ram" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.vm-template-name" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.ssh_password" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.ssh_username" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "data.vsphere_virtual_machine.template (expand)" references: [var.vm-template-name data.vsphere_datacenter.dc (expand)]
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.disksize" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.vsphere-template-folder" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "data.vsphere_host.host (expand)" references: [var.vsphere-cluster data.vsphere_datacenter.dc (expand)]
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.ipv4_gateway" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.vsphere-unverified-ssl" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.dns_server_list" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.ipv4_netmask" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.vsphere_vcenter" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "output.vm_names (expand)" references: [vsphere_virtual_machine.vm (expand) vsphere_virtual_machine.vm["vm2"] vsphere_virtual_machine.vm["vm1"]]
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "vsphere_virtual_machine.vm[\"vm1\"]" references: [local.vms (expand) local.common_templatevars (expand) local.common_templatevars (expand) var.vsphere-datacenter var.vsphere-template-folder data.vsphere_datastore.datastore (expand) var.vm-guest-id data.vsphere_host.host (expand) var.cores-per-socket data.vsphere_network.network (expand) data.vsphere_virtual_machine.template (expand) data.vsphere_virtual_machine.template (expand) data.vsphere_virtual_machine.template (expand) data.vsphere_virtual_machine.template (expand)]
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.vm-name-prefix" references: []
2025-07-10T13:44:43.466-0700 [DEBUG] ReferenceTransformer: "var.vsphere_password" references: []
2025-07-10T13:44:43.468-0700 [DEBUG] Starting graph walk: walkApply
2025-07-10T13:44:43.470-0700 [DEBUG] created provider logger: level=debug
2025-07-10T13:44:43.470-0700 [INFO]  provider: configuring client automatic mTLS
2025-07-10T13:44:43.474-0700 [DEBUG] provider: starting plugin: path=.terraform/providers/registry.terraform.io/vmware/vsphere/2.14.0/darwin_arm64/terraform-provider-vsphere_v2.14.0 args=[".terraform/providers/registry.terraform.io/vmware/vsphere/2.14.0/darwin_arm64/terraform-provider-vsphere_v2.14.0"]
2025-07-10T13:44:43.476-0700 [DEBUG] provider: plugin started: path=.terraform/providers/registry.terraform.io/vmware/vsphere/2.14.0/darwin_arm64/terraform-provider-vsphere_v2.14.0 pid=47854
2025-07-10T13:44:43.476-0700 [DEBUG] provider: waiting for RPC address: plugin=.terraform/providers/registry.terraform.io/vmware/vsphere/2.14.0/darwin_arm64/terraform-provider-vsphere_v2.14.0
2025-07-10T13:44:43.485-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: configuring server automatic mTLS: timestamp=2025-07-10T13:44:43.485-0700
2025-07-10T13:44:43.492-0700 [DEBUG] provider: using plugin: version=5
2025-07-10T13:44:43.492-0700 [DEBUG] provider.terraform-provider-vsphere_v2.14.0: plugin address: address=/var/folders/y9/lntq3k714r19b0v6jtr9z5sw0000gn/T/plugin204876835 network=unix timestamp=2025-07-10T13:44:43.492-0700
2025-07-10T13:44:43.500-0700 [WARN]  ValidateProviderConfig from "provider[\"registry.terraform.io/vmware/vsphere\"]" changed the config value, but that value is unused
2025-07-10T13:44:43.500-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:43 [DEBUG] Cached SOAP client session data not valid or persistence not enabled, new session necessary: timestamp=2025-07-10T13:44:43.500-0700
2025-07-10T13:44:43.500-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:43 [DEBUG] Creating new SOAP API session on endpoint 172.16.101.240: timestamp=2025-07-10T13:44:43.500-0700
2025-07-10T13:44:43.674-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:43 [DEBUG] SOAP API session creation successful: timestamp=2025-07-10T13:44:43.674-0700
2025-07-10T13:44:43.674-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:43 [DEBUG] VMWare vSphere Client configured for URL: 172.16.101.240: timestamp=2025-07-10T13:44:43.674-0700
2025-07-10T13:44:43.674-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:43 [DEBUG] Setting up REST client: timestamp=2025-07-10T13:44:43.674-0700
2025-07-10T13:44:44.205-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] CIS REST client configuration successful: timestamp=2025-07-10T13:44:44.205-0700
2025-07-10T13:44:44.230-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] vsphere_virtual_machine (ID = <new resource>): Performing diff customization and validation: timestamp=2025-07-10T13:44:44.230-0700
2025-07-10T13:44:44.230-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] NetworkInterfaceDiffOperation: Beginning diff validation: timestamp=2025-07-10T13:44:44.230-0700
2025-07-10T13:44:44.230-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] network_interface.0 (key 0 at <new device>): Beginning diff validation: timestamp=2025-07-10T13:44:44.230-0700
2025-07-10T13:44:44.230-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] network_interface.0 (key 0 at <new device>): Diff validation complete: timestamp=2025-07-10T13:44:44.230-0700
2025-07-10T13:44:44.230-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] NetworkInterfaceDiffOperation: Diff validation complete: timestamp=2025-07-10T13:44:44.230-0700
2025-07-10T13:44:44.230-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] vsphere_virtual_machine (ID = <new resource>): resource_pool_id modified without change to host_system_id, marking as computed: timestamp=2025-07-10T13:44:44.230-0700
2025-07-10T13:44:44.230-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskDiffOperation: Beginning disk diff customization: timestamp=2025-07-10T13:44:44.230-0700
2025-07-10T13:44:44.230-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskDiffOperation: Beginning collective diff validation (indexes aligned to new config): timestamp=2025-07-10T13:44:44.230-0700
2025-07-10T13:44:44.230-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] disk.0 (key 0 at <new device>) (<unknown>): Beginning diff validation: timestamp=2025-07-10T13:44:44.230-0700
2025-07-10T13:44:44.230-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] disk.0 (key 0 at <new device>) (<unknown>): Diff validation complete: timestamp=2025-07-10T13:44:44.230-0700
2025-07-10T13:44:44.230-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskDiffOperation: Beginning diff validation and normalization (indexes aligned to old state): timestamp=2025-07-10T13:44:44.230-0700
2025-07-10T13:44:44.230-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskDiffOperation: New resource set post-normalization: (key 0 at <new device>): timestamp=2025-07-10T13:44:44.230-0700
2025-07-10T13:44:44.230-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskDiffOperation: Disk diff customization complete, sending new diff: timestamp=2025-07-10T13:44:44.230-0700
2025-07-10T13:44:44.230-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] Locating vApp container with ID resgroup-2105: timestamp=2025-07-10T13:44:44.230-0700
2025-07-10T13:44:44.231-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] vsphere_virtual_machine (ID = <new resource>): Performing diff customization and validation: timestamp=2025-07-10T13:44:44.231-0700
2025-07-10T13:44:44.231-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] NetworkInterfaceDiffOperation: Beginning diff validation: timestamp=2025-07-10T13:44:44.231-0700
2025-07-10T13:44:44.231-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] network_interface.0 (key 0 at <new device>): Beginning diff validation: timestamp=2025-07-10T13:44:44.231-0700
2025-07-10T13:44:44.231-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] network_interface.0 (key 0 at <new device>): Diff validation complete: timestamp=2025-07-10T13:44:44.231-0700
2025-07-10T13:44:44.231-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] NetworkInterfaceDiffOperation: Diff validation complete: timestamp=2025-07-10T13:44:44.231-0700
2025-07-10T13:44:44.231-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] vsphere_virtual_machine (ID = <new resource>): resource_pool_id modified without change to host_system_id, marking as computed: timestamp=2025-07-10T13:44:44.231-0700
2025-07-10T13:44:44.231-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskDiffOperation: Beginning disk diff customization: timestamp=2025-07-10T13:44:44.231-0700
2025-07-10T13:44:44.231-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskDiffOperation: Beginning collective diff validation (indexes aligned to new config): timestamp=2025-07-10T13:44:44.231-0700
2025-07-10T13:44:44.231-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] disk.0 (key 0 at <new device>) (<unknown>): Beginning diff validation: timestamp=2025-07-10T13:44:44.231-0700
2025-07-10T13:44:44.231-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] disk.0 (key 0 at <new device>) (<unknown>): Diff validation complete: timestamp=2025-07-10T13:44:44.231-0700
2025-07-10T13:44:44.231-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskDiffOperation: Beginning diff validation and normalization (indexes aligned to old state): timestamp=2025-07-10T13:44:44.231-0700
2025-07-10T13:44:44.231-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskDiffOperation: New resource set post-normalization: (key 0 at <new device>): timestamp=2025-07-10T13:44:44.231-0700
2025-07-10T13:44:44.231-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskDiffOperation: Disk diff customization complete, sending new diff: timestamp=2025-07-10T13:44:44.231-0700
2025-07-10T13:44:44.231-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] Locating vApp container with ID resgroup-2105: timestamp=2025-07-10T13:44:44.231-0700
2025-07-10T13:44:44.250-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] contentlibrary.IsContentLibrary: Checking if 423a82ed-2fd3-04cf-2c11-4667af6c7c92 is a content library source: timestamp=2025-07-10T13:44:44.250-0700
2025-07-10T13:44:44.250-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] contentlibrary.ItemFromID: Retrieving library item 423a82ed-2fd3-04cf-2c11-4667af6c7c92: timestamp=2025-07-10T13:44:44.250-0700
2025-07-10T13:44:44.262-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] contentlibrary.IsContentLibrary: Checking if 423a82ed-2fd3-04cf-2c11-4667af6c7c92 is a content library source: timestamp=2025-07-10T13:44:44.262-0700
2025-07-10T13:44:44.262-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] contentlibrary.ItemFromID: Retrieving library item 423a82ed-2fd3-04cf-2c11-4667af6c7c92: timestamp=2025-07-10T13:44:44.262-0700
2025-07-10T13:44:44.932-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] ValidateVirtualMachineClone: Validating fitness of source VM/template 423a82ed-2fd3-04cf-2c11-4667af6c7c92: timestamp=2025-07-10T13:44:44.932-0700
2025-07-10T13:44:44.932-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] Locating virtual machine with UUID "423a82ed-2fd3-04cf-2c11-4667af6c7c92": timestamp=2025-07-10T13:44:44.932-0700
2025-07-10T13:44:44.932-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] Using SearchIndex to look up UUID "423a82ed-2fd3-04cf-2c11-4667af6c7c92": timestamp=2025-07-10T13:44:44.932-0700
2025-07-10T13:44:44.953-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] VM "/Office/vm/williamqiao_vm_template/CentOS-willqiao-Template" found for UUID "423a82ed-2fd3-04cf-2c11-4667af6c7c92": timestamp=2025-07-10T13:44:44.953-0700
2025-07-10T13:44:44.953-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] Fetching properties for VM "/Office/vm/williamqiao_vm_template/CentOS-willqiao-Template": timestamp=2025-07-10T13:44:44.953-0700
2025-07-10T13:44:44.977-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskCloneValidateOperation: Checking existing virtual disk configuration: timestamp=2025-07-10T13:44:44.976-0700
2025-07-10T13:44:44.977-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskRefreshOperation: Found controller "controller-1000" for device "disk-1000-0": timestamp=2025-07-10T13:44:44.977-0700
2025-07-10T13:44:44.977-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskCloneValidateOperation: Disk devices order before sort: disk-1000-0: timestamp=2025-07-10T13:44:44.977-0700
2025-07-10T13:44:44.977-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskCloneValidateOperation: Disk devices order after sort: disk-1000-0: timestamp=2025-07-10T13:44:44.977-0700
2025-07-10T13:44:44.977-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskCloneValidateOperation: Current resource set: (key 0 at <new device>): timestamp=2025-07-10T13:44:44.977-0700
2025-07-10T13:44:44.977-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskCloneValidateOperation: Resource set order after sort: (key 0 at <new device>): timestamp=2025-07-10T13:44:44.977-0700
2025-07-10T13:44:44.977-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskCloneValidateOperation: Running test read operations on all disks: timestamp=2025-07-10T13:44:44.977-0700
2025-07-10T13:44:44.977-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] disk.0 (key 2000 at scsi:0:0) (<unknown>): Reading state: timestamp=2025-07-10T13:44:44.977-0700
2025-07-10T13:44:44.977-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] FindVirtualDevice: Looking for device with key 2000: timestamp=2025-07-10T13:44:44.977-0700
2025-07-10T13:44:44.977-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] FindVirtualDevice: Device found: disk-1000-0: timestamp=2025-07-10T13:44:44.977-0700
2025-07-10T13:44:44.977-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] disk.0 (key 2000 at scsi:0:0) (CentOS-willqiao-Template/CentOS-willqiao-Template.vmdk): Read finished (key and device address may have changed): timestamp=2025-07-10T13:44:44.977-0700
2025-07-10T13:44:44.977-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] DiskCloneValidateOperation: All disks in source validated successfully: timestamp=2025-07-10T13:44:44.977-0700
2025-07-10T13:44:44.977-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] ValidateVirtualMachineClone: Source VM/template 423a82ed-2fd3-04cf-2c11-4667af6c7c92 is a suitable source for cloning: timestamp=2025-07-10T13:44:44.977-0700
2025-07-10T13:44:44.977-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] VAppDiffOperation: Verifying configuration meets requirements for vApp transport: timestamp=2025-07-10T13:44:44.977-0700
2025-07-10T13:44:44.977-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] VAppDiffOperation: ISO transport is not supported on this virtual machine or multiple transport options exist: timestamp=2025-07-10T13:44:44.977-0700
2025-07-10T13:44:44.977-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:44 [DEBUG] vsphere_virtual_machine (ID = <new resource>): Diff customization and validation complete: timestamp=2025-07-10T13:44:44.977-0700
2025-07-10T13:44:44.988-0700 [WARN]  Provider "registry.terraform.io/vmware/vsphere" produced an invalid plan for vsphere_virtual_machine.vm["vm2"], but we are tolerating it because it is using the legacy plugin SDK.
    The following problems may be the cause of any confusing errors from downstream operations:
      - .latency_sensitivity: planned value cty.StringVal("normal") for a non-computed attribute
      - .nvme_controller_count: planned value cty.NumberIntVal(0) for a non-computed attribute
      - .run_tools_scripts_after_resume: planned value cty.True for a non-computed attribute
      - .shutdown_wait_timeout: planned value cty.NumberIntVal(3) for a non-computed attribute
      - .force_power_off: planned value cty.True for a non-computed attribute
      - .scsi_type: planned value cty.StringVal("pvscsi") for a non-computed attribute
      - .extra_config_reboot_required: planned value cty.True for a non-computed attribute
      - .memory_limit: planned value cty.NumberIntVal(-1) for a non-computed attribute
      - .wait_for_guest_ip_timeout: planned value cty.NumberIntVal(0) for a non-computed attribute
      - .ide_controller_count: planned value cty.NumberIntVal(2) for a non-computed attribute
      - .folder: planned value cty.StringVal("Office/vm/williamqiao_vm_template") does not match config value cty.StringVal("/Office/vm/williamqiao_vm_template/")
      - .memory_share_level: planned value cty.StringVal("normal") for a non-computed attribute
      - .migrate_wait_timeout: planned value cty.NumberIntVal(30) for a non-computed attribute
      - .sync_time_with_host: planned value cty.True for a non-computed attribute
      - .wait_for_guest_net_routable: planned value cty.True for a non-computed attribute
      - .wait_for_guest_net_timeout: planned value cty.NumberIntVal(5) for a non-computed attribute
      - .boot_retry_delay: planned value cty.NumberIntVal(10000) for a non-computed attribute
      - .scsi_bus_sharing: planned value cty.StringVal("noSharing") for a non-computed attribute
      - .sata_controller_count: planned value cty.NumberIntVal(0) for a non-computed attribute
      - .tools_upgrade_policy: planned value cty.StringVal("manual") for a non-computed attribute
      - .poweron_timeout: planned value cty.NumberIntVal(300) for a non-computed attribute
      - .cpu_share_level: planned value cty.StringVal("normal") for a non-computed attribute
      - .run_tools_scripts_after_power_on: planned value cty.True for a non-computed attribute
      - .run_tools_scripts_before_guest_standby: planned value cty.True for a non-computed attribute
      - .scsi_controller_count: planned value cty.NumberIntVal(1) for a non-computed attribute
      - .swap_placement_policy: planned value cty.StringVal("inherit") for a non-computed attribute
      - .cpu_limit: planned value cty.NumberIntVal(-1) for a non-computed attribute
      - .run_tools_scripts_before_guest_shutdown: planned value cty.True for a non-computed attribute
      - .disk[0].disk_mode: planned value cty.StringVal("persistent") for a non-computed attribute
      - .disk[0].attach: planned value cty.False for a non-computed attribute
      - .disk[0].io_limit: planned value cty.NumberIntVal(-1) for a non-computed attribute
      - .disk[0].io_share_count: planned value cty.NumberIntVal(0) for a non-computed attribute
      - .disk[0].io_share_level: planned value cty.StringVal("normal") for a non-computed attribute
      - .disk[0].keep_on_remove: planned value cty.False for a non-computed attribute
      - .disk[0].controller_type: planned value cty.StringVal("scsi") for a non-computed attribute
      - .disk[0].disk_sharing: planned value cty.StringVal("sharingNone") for a non-computed attribute
      - .disk[0].io_reservation: planned value cty.NumberIntVal(0) for a non-computed attribute
      - .disk[0].unit_number: planned value cty.NumberIntVal(0) for a non-computed attribute
      - .disk[0].write_through: planned value cty.False for a non-computed attribute
      - .network_interface[0].bandwidth_reservation: planned value cty.NumberIntVal(0) for a non-computed attribute
      - .network_interface[0].bandwidth_limit: planned value cty.NumberIntVal(-1) for a non-computed attribute
      - .network_interface[0].bandwidth_share_level: planned value cty.StringVal("normal") for a non-computed attribute
      - .clone[0].timeout: planned value cty.NumberIntVal(30) for a non-computed attribute
[0m[1mvsphere_virtual_machine.vm["vm2"]: Creating...[0m[0m
2025-07-10T13:44:44.991-0700 [INFO]  Starting apply for vsphere_virtual_machine.vm["vm2"]
2025-07-10T13:44:45.004-0700 [DEBUG] vsphere_virtual_machine.vm["vm2"]: applying the planned Create change
2025-07-10T13:44:45.008-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] setting computed for "vapp_transport" from ComputedKeys: timestamp=2025-07-10T13:44:45.008-0700
2025-07-10T13:44:45.008-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] setting computed for "guest_ip_addresses" from ComputedKeys: timestamp=2025-07-10T13:44:45.008-0700
2025-07-10T13:44:45.009-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] vsphere_virtual_machine (ID = <new resource>): Beginning create: timestamp=2025-07-10T13:44:45.009-0700
2025-07-10T13:44:45.009-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] tagsClientIfDefined: No tags configured, skipping loading of tagging client: timestamp=2025-07-10T13:44:45.009-0700
2025-07-10T13:44:45.009-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] vsphere_virtual_machine (ID = <new resource>): VM being created from clone: timestamp=2025-07-10T13:44:45.009-0700
2025-07-10T13:44:45.009-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] Locating resource pool with ID resgroup-2105: timestamp=2025-07-10T13:44:45.009-0700
2025-07-10T13:44:45.019-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] Resource pool found: resgroup-2105: timestamp=2025-07-10T13:44:45.019-0700
2025-07-10T13:44:45.020-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] Locating folder at path "/Office/vm/williamqiao_vm_template/" relative to virtual machine root: timestamp=2025-07-10T13:44:45.019-0700
2025-07-10T13:44:45.021-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] ValidateVirtualMachineClone: Validating fitness of source VM/template 423a82ed-2fd3-04cf-2c11-4667af6c7c92: timestamp=2025-07-10T13:44:45.021-0700
2025-07-10T13:44:45.021-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] Locating virtual machine with UUID "423a82ed-2fd3-04cf-2c11-4667af6c7c92": timestamp=2025-07-10T13:44:45.021-0700
2025-07-10T13:44:45.021-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] Using SearchIndex to look up UUID "423a82ed-2fd3-04cf-2c11-4667af6c7c92": timestamp=2025-07-10T13:44:45.021-0700
2025-07-10T13:44:45.040-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] VM "/Office/vm/williamqiao_vm_template/CentOS-willqiao-Template" found for UUID "423a82ed-2fd3-04cf-2c11-4667af6c7c92": timestamp=2025-07-10T13:44:45.039-0700
2025-07-10T13:44:45.040-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] Fetching properties for VM "/Office/vm/williamqiao_vm_template/CentOS-willqiao-Template": timestamp=2025-07-10T13:44:45.039-0700
2025-07-10T13:44:45.061-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] DiskCloneValidateOperation: Checking existing virtual disk configuration: timestamp=2025-07-10T13:44:45.060-0700
2025-07-10T13:44:45.061-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] DiskRefreshOperation: Found controller "controller-1000" for device "disk-1000-0": timestamp=2025-07-10T13:44:45.061-0700
2025-07-10T13:44:45.061-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] DiskCloneValidateOperation: Disk devices order before sort: disk-1000-0: timestamp=2025-07-10T13:44:45.061-0700
2025-07-10T13:44:45.061-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] DiskCloneValidateOperation: Disk devices order after sort: disk-1000-0: timestamp=2025-07-10T13:44:45.061-0700
2025-07-10T13:44:45.061-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] DiskCloneValidateOperation: Current resource set: (key 0 at <new device>): timestamp=2025-07-10T13:44:45.061-0700
2025-07-10T13:44:45.061-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] DiskCloneValidateOperation: Resource set order after sort: (key 0 at <new device>): timestamp=2025-07-10T13:44:45.061-0700
2025-07-10T13:44:45.061-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] DiskCloneValidateOperation: Running test read operations on all disks: timestamp=2025-07-10T13:44:45.061-0700
2025-07-10T13:44:45.061-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] disk.0 (key 2000 at scsi:0:0) (<unknown>): Reading state: timestamp=2025-07-10T13:44:45.061-0700
2025-07-10T13:44:45.061-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] FindVirtualDevice: Looking for device with key 2000: timestamp=2025-07-10T13:44:45.061-0700
2025-07-10T13:44:45.061-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] FindVirtualDevice: Device found: disk-1000-0: timestamp=2025-07-10T13:44:45.061-0700
2025-07-10T13:44:45.061-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] disk.0 (key 2000 at scsi:0:0) (CentOS-willqiao-Template/CentOS-willqiao-Template.vmdk): Read finished (key and device address may have changed): timestamp=2025-07-10T13:44:45.061-0700
2025-07-10T13:44:45.061-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] DiskCloneValidateOperation: All disks in source validated successfully: timestamp=2025-07-10T13:44:45.061-0700
2025-07-10T13:44:45.061-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] ValidateVirtualMachineClone: Source VM/template 423a82ed-2fd3-04cf-2c11-4667af6c7c92 is a suitable source for cloning: timestamp=2025-07-10T13:44:45.061-0700
2025-07-10T13:44:45.061-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] VAppDiffOperation: Verifying configuration meets requirements for vApp transport: timestamp=2025-07-10T13:44:45.061-0700
2025-07-10T13:44:45.061-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] VAppDiffOperation: ISO transport is not supported on this virtual machine or multiple transport options exist: timestamp=2025-07-10T13:44:45.061-0700
2025-07-10T13:44:45.061-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] vsphere_virtual_machine (ID = <new resource>): Diff customization and validation complete: timestamp=2025-07-10T13:44:45.061-0700
2025-07-10T13:44:45.063-0700 [WARN]  Provider "registry.terraform.io/vmware/vsphere" produced an invalid plan for vsphere_virtual_machine.vm["vm1"], but we are tolerating it because it is using the legacy plugin SDK.
    The following problems may be the cause of any confusing errors from downstream operations:
      - .scsi_type: planned value cty.StringVal("pvscsi") for a non-computed attribute
      - .extra_config_reboot_required: planned value cty.True for a non-computed attribute
      - .memory_limit: planned value cty.NumberIntVal(-1) for a non-computed attribute
      - .wait_for_guest_ip_timeout: planned value cty.NumberIntVal(0) for a non-computed attribute
      - .ide_controller_count: planned value cty.NumberIntVal(2) for a non-computed attribute
      - .folder: planned value cty.StringVal("Office/vm/williamqiao_vm_template") does not match config value cty.StringVal("/Office/vm/williamqiao_vm_template/")
      - .memory_share_level: planned value cty.StringVal("normal") for a non-computed attribute
      - .migrate_wait_timeout: planned value cty.NumberIntVal(30) for a non-computed attribute
      - .sync_time_with_host: planned value cty.True for a non-computed attribute
      - .wait_for_guest_net_routable: planned value cty.True for a non-computed attribute
      - .wait_for_guest_net_timeout: planned value cty.NumberIntVal(5) for a non-computed attribute
      - .boot_retry_delay: planned value cty.NumberIntVal(10000) for a non-computed attribute
      - .scsi_bus_sharing: planned value cty.StringVal("noSharing") for a non-computed attribute
      - .sata_controller_count: planned value cty.NumberIntVal(0) for a non-computed attribute
      - .tools_upgrade_policy: planned value cty.StringVal("manual") for a non-computed attribute
      - .poweron_timeout: planned value cty.NumberIntVal(300) for a non-computed attribute
      - .cpu_share_level: planned value cty.StringVal("normal") for a non-computed attribute
      - .run_tools_scripts_after_power_on: planned value cty.True for a non-computed attribute
      - .run_tools_scripts_before_guest_standby: planned value cty.True for a non-computed attribute
      - .scsi_controller_count: planned value cty.NumberIntVal(1) for a non-computed attribute
      - .swap_placement_policy: planned value cty.StringVal("inherit") for a non-computed attribute
      - .cpu_limit: planned value cty.NumberIntVal(-1) for a non-computed attribute
      - .run_tools_scripts_before_guest_shutdown: planned value cty.True for a non-computed attribute
      - .latency_sensitivity: planned value cty.StringVal("normal") for a non-computed attribute
      - .nvme_controller_count: planned value cty.NumberIntVal(0) for a non-computed attribute
      - .run_tools_scripts_after_resume: planned value cty.True for a non-computed attribute
      - .shutdown_wait_timeout: planned value cty.NumberIntVal(3) for a non-computed attribute
      - .force_power_off: planned value cty.True for a non-computed attribute
      - .disk[0].attach: planned value cty.False for a non-computed attribute
      - .disk[0].io_limit: planned value cty.NumberIntVal(-1) for a non-computed attribute
      - .disk[0].io_share_count: planned value cty.NumberIntVal(0) for a non-computed attribute
      - .disk[0].io_share_level: planned value cty.StringVal("normal") for a non-computed attribute
      - .disk[0].keep_on_remove: planned value cty.False for a non-computed attribute
      - .disk[0].controller_type: planned value cty.StringVal("scsi") for a non-computed attribute
      - .disk[0].disk_sharing: planned value cty.StringVal("sharingNone") for a non-computed attribute
      - .disk[0].io_reservation: planned value cty.NumberIntVal(0) for a non-computed attribute
      - .disk[0].unit_number: planned value cty.NumberIntVal(0) for a non-computed attribute
      - .disk[0].write_through: planned value cty.False for a non-computed attribute
      - .disk[0].disk_mode: planned value cty.StringVal("persistent") for a non-computed attribute
      - .network_interface[0].bandwidth_reservation: planned value cty.NumberIntVal(0) for a non-computed attribute
      - .network_interface[0].bandwidth_limit: planned value cty.NumberIntVal(-1) for a non-computed attribute
      - .network_interface[0].bandwidth_share_level: planned value cty.StringVal("normal") for a non-computed attribute
      - .clone[0].timeout: planned value cty.NumberIntVal(30) for a non-computed attribute
[0m[1mvsphere_virtual_machine.vm["vm1"]: Creating...[0m[0m
2025-07-10T13:44:45.063-0700 [INFO]  Starting apply for vsphere_virtual_machine.vm["vm1"]
2025-07-10T13:44:45.066-0700 [DEBUG] vsphere_virtual_machine.vm["vm1"]: applying the planned Create change
2025-07-10T13:44:45.070-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] setting computed for "guest_ip_addresses" from ComputedKeys: timestamp=2025-07-10T13:44:45.069-0700
2025-07-10T13:44:45.071-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] setting computed for "vapp_transport" from ComputedKeys: timestamp=2025-07-10T13:44:45.070-0700
2025-07-10T13:44:45.071-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] vsphere_virtual_machine (ID = <new resource>): Beginning create: timestamp=2025-07-10T13:44:45.071-0700
2025-07-10T13:44:45.071-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] tagsClientIfDefined: No tags configured, skipping loading of tagging client: timestamp=2025-07-10T13:44:45.071-0700
2025-07-10T13:44:45.071-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] vsphere_virtual_machine (ID = <new resource>): VM being created from clone: timestamp=2025-07-10T13:44:45.071-0700
2025-07-10T13:44:45.071-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] Locating resource pool with ID resgroup-2105: timestamp=2025-07-10T13:44:45.071-0700
2025-07-10T13:44:45.077-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] Folder located: "/Office/vm/williamqiao_vm_template": timestamp=2025-07-10T13:44:45.077-0700
2025-07-10T13:44:45.077-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] contentlibrary.IsContentLibrary: Checking if 423a82ed-2fd3-04cf-2c11-4667af6c7c92 is a content library source: timestamp=2025-07-10T13:44:45.077-0700
2025-07-10T13:44:45.077-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] contentlibrary.ItemFromID: Retrieving library item 423a82ed-2fd3-04cf-2c11-4667af6c7c92: timestamp=2025-07-10T13:44:45.077-0700
2025-07-10T13:44:45.079-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] Resource pool found: resgroup-2105: timestamp=2025-07-10T13:44:45.079-0700
2025-07-10T13:44:45.079-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] Locating folder at path "/Office/vm/williamqiao_vm_template/" relative to virtual machine root: timestamp=2025-07-10T13:44:45.079-0700
2025-07-10T13:44:45.124-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] ExpandVirtualMachineCloneSpec: Preparing clone spec for VM: timestamp=2025-07-10T13:44:45.123-0700
2025-07-10T13:44:45.124-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] Locating datastore with ID "datastore-2106": timestamp=2025-07-10T13:44:45.124-0700
2025-07-10T13:44:45.134-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] Datastore with ID "datastore-2106" found: timestamp=2025-07-10T13:44:45.134-0700
2025-07-10T13:44:45.134-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] ExpandVirtualMachineCloneSpec: Cloning from UUID: 423a82ed-2fd3-04cf-2c11-4667af6c7c92: timestamp=2025-07-10T13:44:45.134-0700
2025-07-10T13:44:45.134-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] Locating virtual machine with UUID "423a82ed-2fd3-04cf-2c11-4667af6c7c92": timestamp=2025-07-10T13:44:45.134-0700
2025-07-10T13:44:45.134-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] Folder located: "/Office/vm/williamqiao_vm_template": timestamp=2025-07-10T13:44:45.134-0700
2025-07-10T13:44:45.134-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] contentlibrary.IsContentLibrary: Checking if 423a82ed-2fd3-04cf-2c11-4667af6c7c92 is a content library source: timestamp=2025-07-10T13:44:45.134-0700
2025-07-10T13:44:45.134-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] contentlibrary.ItemFromID: Retrieving library item 423a82ed-2fd3-04cf-2c11-4667af6c7c92: timestamp=2025-07-10T13:44:45.134-0700
2025-07-10T13:44:45.134-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] Using SearchIndex to look up UUID "423a82ed-2fd3-04cf-2c11-4667af6c7c92": timestamp=2025-07-10T13:44:45.134-0700
2025-07-10T13:44:45.152-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] VM "/Office/vm/williamqiao_vm_template/CentOS-willqiao-Template" found for UUID "423a82ed-2fd3-04cf-2c11-4667af6c7c92": timestamp=2025-07-10T13:44:45.152-0700
2025-07-10T13:44:45.152-0700 [INFO]  provider.terraform-provider-vsphere_v2.14.0: 2025/07/10 13:44:45 [DEBUG] Fetching proper