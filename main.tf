# =================== #
# Deploying VMware VM #
# =================== #
# ----
terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "1.12.0"
    }
  }
}

# Connect to VMware vSphere vCenter
provider "vsphere" {
  user           = var.vsphere-user
  password       = var.vsphere-password
  vsphere_server = var.vsphere-vcenter

  # If you have a self-signed cert
  allow_unverified_ssl = var.vsphere-unverified-ssl
}

# Define VMware vSphere
data "vsphere_datacenter" "dc" {
  name = var.vsphere-datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vm-datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere-cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vm-network
  datacenter_id = data.vsphere_datacenter.dc.id
}

############################## MASTER ######################################

data "vsphere_virtual_machine" "template" {
  name          = "/${var.vsphere-datacenter}/vm/${var.vsphere-template-folder}/${var.vm-master-template-name}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Create VMs
resource "vsphere_virtual_machine" "vm-master" {
  count = var.vm-master-count

  name             = "${var.vm-name-prefix}-${var.vm-master-name}-${count.index + 1}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.vm-cpu
  memory   = var.vm-ram
  scsi_type = var.vm-scsi
  guest_id = var.vm-guest-id

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "${var.vm-name-prefix}-${var.vm-master-name}-${count.index + 1}"
    size  = var.vm-hdd-master
    thin_provisioned = false
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      timeout = 0

      linux_options {
        host_name = "${var.vm-name-prefix}-${var.vm-master-name}-${count.index + 1}"
        domain    = var.vm-domain
      }

      network_interface {}
    }
  }
}

################################ WORKER #######################################

data "vsphere_virtual_machine" "template-worker" {
  name          = "/${var.vsphere-datacenter}/vm/${var.vsphere-template-folder}/${var.vm-template-name}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  count = var.vm-worker-count

  name             = "${var.vm-name-prefix}-${var.vm-worker-name}-${count.index + 1}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.vm-cpu
  memory   = var.vm-ram
  scsi_type = var.vm-scsi
  guest_id = var.vm-guest-id

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "${var.vm-name-prefix}-${var.vm-worker-name}-${count.index + 1}"
    size  = var.vm-hdd
    thin_provisioned = false
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template-worker.id

    customize {
      timeout = 0

      linux_options {
        host_name = "${var.vm-name-prefix}-${var.vm-worker-name}-${count.index + 1}"
        domain    = var.vm-domain
      }

      network_interface {}
    }
  }
}
