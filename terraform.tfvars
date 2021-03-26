# ======================== #
# VMware VMs configuration #
# ======================== #

vm-master-count = "3"
vm-worker-count = "2"
vm-master-name = "master"
vm-worker-name = "worker"
vm-template-name = "CentOS-7-9-2009-template"
vm-cpu = 4
vm-ram = 4096
vm-hdd = 40
vm-scsi = "lsilogic"
vm-guest-id = "centos64Guest"

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
vsphere-cluster = "clr-G1"

# vSphere Datastore used to deploy VMs
vm-datastore = "vsanDatastore-G1"

# vSphere Network used to deploy VMs
vm-network = "VM Network"

# Linux virtual machine domain name
vm-domain = "technocom.tech"
