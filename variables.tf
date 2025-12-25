variable "opennebula_endpoint" {
    description = "Open Nebula endpoint URL"
    default = "https://nuada.zcu.cz/RPC2"
}

variable "opennebula_username" {
    description = "Open Nebula username"
    default = "lrunt"
}

variable "opennebula_token" {
    description = "Open Nebula token"
    default = "None"
}

variable "ssh_public_key" {
    description = "SSH public key"
    default = "None"
}

variable "vm_count" {
    description = "Number of VMs"
    default = 1
}
variable "vm_admin_user" {
    description = "Username of the admin user"
    default = "nodeadm"
  
}
variable "vm_node_init_log" {
    description = "Node initialization log file"
    default = "/var/log/node-init.log"
}
variable "vm_imagedatastore_id" {
    description = "Open Nebula datastore ID"
    default = 101 # => "nuada_pool"
}
variable "vm_network_id" {
    description = "ID of the virtual network to attach to the virtual machine"
    default = 3 # => "vlan173"
}
variable "vm_image_name" {
    description = "VM OS image name"
}
variable "vm_image_url"  {
    description = "VM OS image URL"
}
variable "vm_machine_name" {
    description = "Name of the VM"
    default = "vm-node"
}