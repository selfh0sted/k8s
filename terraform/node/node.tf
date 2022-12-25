variable "ssh_key" {}
variable "name" {}
variable "cores" {}
variable "memory" {}
variable "template" {}
variable "user" {}
variable "type" {}
variable "ipaddress" {}
variable "gateway" {}
variable "countIndex" {}
variable "pm_target_node" {}

resource "proxmox_vm_qemu" "k8s-node" {
    name = var.name
    target_node = var.pm_target_node
    
    # Hardware Settings
    cores = var.cores
    memory = var.memory
    agent = 1
    disk {
        type = "scsi"
        storage = "local-lvm"
        size = "10G"
    }

    # Clone Source
    clone = var.template
    full_clone = false
    
    # Cloud Init
    sshkeys = var.ssh_key.public
    ipconfig0 = "ip=${var.ipaddress},gw=${var.gateway}"
    lifecycle {
    ignore_changes  = [
      network,disk[0].size
    ]
  }
}

#resource "ansible_host" "k8s-node" {
#    inventory_hostname = var.name
#    vars = {
#        ansible_host = proxmox_vm_qemu.k8s-node.default_ipv4_address
#        ansible_user = var.user
#        ansible_ssh_private_key_file: "ssh_key"
#    }
#    groups = concat([var.type], ["${var.type}-${var.countIndex == 0 ? "first" : "rest"}"])
#}
#
#resource "ansible_host_var" "k8s-node" {
#  inventory_hostname = var.name
#  key = "countIndex"
#  value = var.countIndex
#}