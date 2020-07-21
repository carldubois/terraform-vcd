# Authentication using Environmental Variables

provider "vault" {
  version = "~> 2.10"
  token   = var.token_id
  address = var.vault_addr
}

data "vault_generic_secret" "vcduser" {
  path = "secret/gsduser"
}

data "vault_generic_secret" "vcdpassword" {
  path = "secret/gsdpassword"
}

# Configure vCD Access
provider "vcd" {
  version              = "~> 2.8"
  url                  = var.vcd_url
  org                  = var.org
  vdc                  = var.vdc
  user                 = data.vault_generic_secret.vcduser.data["gsduser"]
  password             = data.vault_generic_secret.vcdpassword.data["gsdpassword"]
  allow_unverified_ssl = "true"
}

# Create vApp

resource "vcd_vapp" "lab_template" {
  name = "ii-lab-Module1"
}

# Create vApp Networks

resource "vcd_vapp_network" "vAppNet-MGMT" {
  name             = "VAppNet-vAppNet-vAppNet-MGMT"
  vapp_name        = vcd_vapp.lab_template.name
  gateway          = "192.168.2.1"
  netmask          = "255.255.255.0"
  dns1             = "10.255.0.1"
  dns_suffix       = "wwtatc.local"
  org_network_name = "vCD-PermNet"

}

resource "vcd_vapp_network" "External" {
  name       = "External"
  vapp_name  = vcd_vapp.lab_template.name
  gateway    = "10.128.10.1"
  netmask    = "255.255.255.0"
  dns1       = "10.255.0.1"
  dns_suffix = "wwtatc.local"
}

resource "vcd_vapp_network" "Internal" {
  name       = "Internal"
  vapp_name  = vcd_vapp.lab_template.name
  gateway    = "10.128.20.1"
  netmask    = "255.255.255.0"
  dns1       = "10.255.0.1"
  dns_suffix = "wwtatc.local"
}

# Create Automation VM, Ansible, Terraform and AZ login, Nics, Attached Networks
resource "vcd_vapp_vm" "Automation_VM" {
  vapp_name           = vcd_vapp.lab_template.name
  name                = "ii-Lab-Ansible-Tower"
  vm_name_in_template = "Ansible Tower"
  power_on            = "true"
  catalog_name        = var.catalog
  template_name       = var.template_name
  memory              = 4096
  cpus                = 2
  cpu_cores           = 1

  network {
    type               = "vapp"
    name               = vcd_vapp_network.vAppNet-MGMT.name
    ip_allocation_mode = "DHCP"
    is_primary         = true

  }

  network {
    type               = "vapp"
    name               = vcd_vapp_network.External.name
    ip_allocation_mode = "DHCP"
    is_primary         = false
  }

  network {
    type               = "vapp"
    name               = vcd_vapp_network.Internal.name
    ip_allocation_mode = "DHCP"
    is_primary         = false
  }

  depends_on = [vcd_vapp.lab_template]
}

# Create Ubuntu Server #2, Nics, Attached Networks

resource "vcd_vapp_vm" "Win10-Jumpbox" {
  vapp_name           = vcd_vapp.lab_template.name
  name                = "ii-Lab-Win10-Jumpbox2"
  vm_name_in_template = "Win10-Jumpbox2"
  power_on            = "true"
  catalog_name        = var.catalog
  template_name       = var.template_name
  memory              = 4096
  cpus                = 2
  cpu_cores           = 1


  network {
    type               = "vapp"
    name               = vcd_vapp_network.vAppNet-MGMT.name
    ip_allocation_mode = "DHCP"
    is_primary         = true
  }

  network {
    type               = "vapp"
    name               = vcd_vapp_network.External.name
    ip_allocation_mode = "DHCP"
    is_primary         = false
  }

  network {
    type               = "vapp"
    name               = vcd_vapp_network.Internal.name
    ip_allocation_mode = "DHCP"
    is_primary         = false
  }

  depends_on = [vcd_vapp.lab_template]
}