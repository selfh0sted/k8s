module "controlplane" {
    count = var.controlplane_count
    memory = var.controlplane_memory
    cores = var.controlplane_cores
    source = "./node"
    ssh_key = var.ssh_key
    name = "k8s-controlplane${count.index}"
    type = "controlplane"
    countIndex = count.index
    user = var.vm_user
    template = var.vm_template
    pm_target_node = var.pm_target_node
    ipaddress = "${var.controlplane_ip_addresses}${count.index+1}/16"
    gateway = "10.0.0.1"
}

module "worker" {
    count = var.worker_count
    memory = var.worker_memory
    cores = var.worker_cores
    source = "./node"
    ssh_key = var.ssh_key
    name = "k8s-worker${count.index}"
    type = "worker"
    user = var.vm_user
    template = var.vm_template
    countIndex = count.index
    pm_target_node = var.pm_target_node
    ipaddress = "${var.worker_ip_addresses}${count.index+1}/16"
    gateway = "10.0.0.1"
}