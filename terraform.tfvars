# ======================== #
# VMware VMs configuration #
# ======================== #

vm-count = "1"
vm-name = "ubuntu-1604-tf"
#vm-template-name = "Ubuntu-1804-Template"
vm-template-name = "ubuntu-1604-terraform-template"
vm-cpu = 2
vm-ram = 4096
vm-guest-id = "ubuntu64Guest"

# ============================ #
# VMware vSphere configuration #
# ============================ #

# VMware vCenter IP/FQDN
vsphere-vcenter = "192.168.0.111"

# VMware vSphere username used to deploy the infrastructure
vsphere-user = "fga@technocom.tech"

# VMware vSphere password used to deploy the infrastructure
vsphere-password = var.vsphere_password

# Skip the verification of the vCenter SSL certificate (true/false)
vsphere-unverified-ssl = "true"

# vSphere datacenter name where the infrastructure will be deployed
vsphere-datacenter = "technocom"

# vSphere cluster name where the infrastructure will be deployed
vsphere-cluster = "clr-G3"

# vSphere Datastore used to deploy VMs 
vm-datastore = "vsanDatastore-G3"

# vSphere Network used to deploy VMs 
vm-network = "VM Network"

# Linux virtual machine domain name
vm-domain = "technocom.tech"
