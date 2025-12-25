# https://registry.terraform.io/providers/OpenNebula/opennebula/latest/docs

# Terraform provider dependency:
terraform {
  required_providers {
    opennebula = {
      source = "OpenNebula/opennebula"
      version = "~> 1.2"
    }
  }
}

# Terraform provider parameters definition:
provider "opennebula" {
  endpoint      = "${var.opennebula_endpoint}"
  username      = "${var.opennebula_username}"
  password      = "${var.opennebula_token}"
}

# Resource (VM) definition:
resource "opennebula_virtual_machine" "vmnode" {
  count = var.vm_count
  name = "vmnode-${count.index + 1}"
  description = "Main node VM"
  cpu = 1
  vcpu = 1
  memory = 1024
  permissions = "600"
  group = "users"

  context = {
    NETWORK  = "YES"
    HOSTNAME = "$NAME"
    SSH_PUBLIC_KEY = "${var.ssh_public_key}"
    START_SCRIPT = "echo 'Wuz here :-)' >> /etc/my-message"
  }
  os {
    arch = "x86_64"
    boot = "disk0"
  }
  disk {
    image_id = 687 #opennebula_image.os-image.id
    target   = "vda"
    size     = 12000 # 12GB
  }
  graphics {
    listen = "0.0.0.0"
    type   = "vnc"
  }
  # The Network Interface Controller is connected to 'vlan173' network (147.228.173.0/24) which has ID = 3
  nic {
    network_id = 3
  }

  connection {
    type = "ssh"
    user = "root"
    host = "${self.ip}"
    private_key = "${file("/var/iac-dev-container-data/id_ecdsa")}"
  }

  provisioner "file" {
    source = "myconfig.conf"
    destination = "/etc/myconfig.conf"
  }
}

# Outputs

output "vm_nodes_ips" {
  value = opennebula_virtual_machine.vmnode.*.ip
}

#output "vm_node_1_mac" {
#  value = opennebula_virtual_machine.vmnode.*.nic[0].computed_mac
#}

resource "local_file" "host_inventory" {
  content =  templatefile("host-inventory.template", {
    ip_list = opennebula_virtual_machine.vmnode.*.ip
  })
  filename = "host-inventory.yaml"
}

#
# EOF
#