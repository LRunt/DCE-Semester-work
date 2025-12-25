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