#===========================#
# VMware vCenter connection #
#===========================#

variable "vsphere-user" {
  type        = string
  description = "VMware vSphere user name"
}

variable "vsphere-password" {
  type        = string
  description = "VMware vSphere password"
  sensitive   = true
}

variable "vsphere-vcenter" {
  type        = string
  description = "VMWare vCenter server FQDN / IP"
}

variable "vsphere-unverified-ssl" {
  type        = string
  description = "Is the VMware vCenter using a self signed certificate (true/false)"
}

variable "vsphere-datacenter" {
  type        = string
  description = "VMWare vSphere datacenter"
}

variable "vsphere-cluster" {
  type        = string
  description = "VMWare vSphere cluster"
  default     = ""
}

variable "vsphere-template-folder" {
  type        = string
  description = "Template folder"
  default = "terraform-template"
}

#================================#
# VMware vSphere virtual machine #
#================================#

variable "vm-master-count" {
  type        = string
  description = "Number of VM"
  default     =  1
}

variable "vm-worker-count" {
  type        = string
  description = "Number of VM"
  default     =  1
}

variable "vm-name-prefix" {
  type        = string
  description = "Name of VM prefix"
  default     =  "k8s"
}

variable "vm-datastore" {
  type        = string
  description = "Datastore used for the vSphere virtual machines"
}

variable "vm-network" {
  type        = string
  description = "Network used for the vSphere virtual machines"
  default     = "VM Network"
}

variable "vm-linked-clone" {
  type        = string
  description = "Use linked clone to create the vSphere virtual machine from the template (true/false). If you would like to use the linked clone feature, your template need to have one and only one snapshot"
  default     = "false"
}

variable "vm-cpu" {
  type        = string
  description = "Number of vCPU for the vSphere virtual machines"
  default     = "2"
}

variable "vm-ram" {
  type        = string
  description = "Amount of RAM for the vSphere virtual machines (example: 2048)"
  default     = "1024"
}

variable "vm-hdd-master" {
  type        = string
  description = "Disk size HDD for the vSphere virtual machines (example: 25)"
  default     = "16"
}

variable "vm-hdd" {
  type        = string
  description = "Disk size HDD for the vSphere virtual machines (example: 25)"
  default     = "16"
}

variable "vm-scsi" {
  type        = string
  description = "The common type of all SCSI controllers on this virtual machine."
  default     = "pvscsi"
}

variable "vm-master-name" {
  type        = string
  description = "The name of the vSphere virtual machines and the hostname of the machine"
  default     = "master"
}

variable "vm-worker-name" {
  type        = string
  description = "The name of the vSphere virtual machines and the hostname of the machine"
  default     = "worker"
}

variable "vm-guest-id" {
  type        = string
  description = "The ID of virtual machines operating system"
}

variable "vm-template-name" {
  type        = string
  description = "The template to clone to create the VM"
}

variable "vm-master-template-name" {
  type        = string
  description = "The template to clone to create the VM"
}

variable "vm-domain" {
  type        = string
  description = "Linux virtual machine domain name for the machine. This, along with host_name, make up the FQDN of the virtual machine"
  default     = ""
}
