# ======================== #
# VMware VMs configuration #
# ======================== #

vm-master-count = "3"
vm-worker-count = "3"
vm-name-prefix = "K8S-NODE"
vm-master-name = "MASTER"
vm-worker-name = "WORKER"
vm-master-template-name = "K8S-Master-CentOS-7-9-2009-template"
vm-template-name = "K8S-CentOS-7-9-2009-template"
vm-cpu = 16
vm-ram = 32768
vm-hdd-master = 25
vm-hdd = 100
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
vsphere-cluster = "clr-G3"

# vSphere Datastore used to deploy VMs
vm-datastore = "vsanDatastore-G3"

# vSphere Network used to deploy VMs
vm-network = "VM Network"

# Linux virtual machine domain name
vm-domain = "technocom.tech"
