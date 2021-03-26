# How to deploy VMware vSphere Virtual Machines using Terraform

Blog Post --> https://medium.com/@gmusumeci/deploying-vmware-vsphere-virtual-machines-with-packer-terraform-d0211f72b7f5

* **main.tf** --> create virtual machines

* **variables.tf** --> variables file

* **terraform.tfvars** --> update vSphere credentials and other settings

# Для запуска добавить файл с паролем для доступа в vSphere
secret.tfvars
содержимое: vsphere-password="пароль" 

Выполнить:
* **terraform plan -var-file=secret.tfvars
