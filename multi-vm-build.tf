# Authentication using Environmental Variables

provider "vault" {
  version = "~> 2.10"
  token = "s.18B0K15ej8p2MeqwRifXVFmx"
  #token_name = "multi-vm"
  address = var.vault_addr
}

data "vault_generic_secret" "vcd" {
  path = "secret/gsd"
}

# Configure vCD Access
provider "vcd" {
  version = "~> 2.8"
  url      = var.vcd_url
  org      = var.org
  vdc      = var.vdc
  user     = var.vcduser
  password = var.vcdpassword
  allow_unverified_ssl = "true"
}

# Create vApp

resource "vcd_vapp" "lab_template" {
  name = "lab_template"
}

# Create vApp Networks

resource "vcd_vapp_network" "vappNet0" {


  name               = "OOB"
  vapp_name          = vcd_vapp.lab_template.name
  gateway            = "192.168.200.254"
  netmask            = "255.255.255.0"
  dns1               = "10.255.0.1"
  dns_suffix         = "sandbox.wwtatc.local"
 
}

resource "vcd_vapp_network" "vappNet1" {


  name               = "net1"
  vapp_name          = vcd_vapp.lab_template.name
  gateway            = "192.168.1.254"
  netmask            = "255.255.255.0"
  dns1               = "10.255.0.1"
  dns_suffix         = "sandbox.wwtatc.local"
 
}

resource "vcd_vapp_network" "vappNet2" {


  name               = "net2"
  vapp_name          = vcd_vapp.lab_template.name
  gateway            = "192.168.2.254"
  netmask            = "255.255.255.0"
  dns1               = "10.255.0.1"
  dns_suffix         = "sandbox.wwtatc.local"
 
}

resource "vcd_vapp_network" "vappNet3" {


  name               = "net3"
  vapp_name          = vcd_vapp.lab_template.name
  gateway            = "192.168.3.254"
  netmask            = "255.255.255.0"
  dns1               = "10.255.0.1"
  dns_suffix         = "sandbox.wwtatc.local"
 
}

# Create Ubuntu Server #1, Nics, Attached Networks

resource "vcd_vapp_vm" "vyos-1" {
  #vapp_name =   vcd_vapp.lab_template.name
  vapp_name = "a-open-white-network-sandbox-v3"
  name          = "S4-VyOS"
  power_on      = "true"
  catalog_name  = "Platform Lab Base Templates"
  #template_name = "labs-ubuntu1804server-041420"
  template_name = "S4-VyOS"
  memory        = 2048
  cpus          = 2
  cpu_cores     = 1


  network {
    type               = "vapp"
    name               = vcd_vapp_network.vappNet0.name
    ip_allocation_mode = "MANUAL"
    ip                 = "192.168.200.254"
    is_primary         = true
  }

  network {
    type               = "vapp"
    name               = vcd_vapp_network.vappNet1.name
    ip_allocation_mode = "MANUAL"
    ip                 = "192.168.1.254"
    is_primary         = false
  }

network {
    type               = "vapp"
    name               = vcd_vapp_network.vappNet2.name
    ip_allocation_mode = "MANUAL"
    ip                 = "192.168.2.254"
    is_primary         = false
  }

  network {
    type               = "vapp"
    name               = vcd_vapp_network.vappNet3.name
    ip_allocation_mode = "MANUAL"
    ip                 = "192.168.3.254"
    is_primary         = false
  }

  depends_on    = [vcd_vapp.lab_template]
}

# Create Ubuntu Server #2, Nics, Attached Networks

resource "vcd_vapp_vm" "jump-1" {
  #vapp_name =   vcd_vapp.lab_template.name
  vapp_name = "Avi_Automation_Lab_v5"
  name          = "Win10-Jumpbox"
  power_on      = "true"
  catalog_name  = "Platform Lab Base Templates"
  #template_name = "labs-ubuntu1804server-041420"
  template_name = "Win10-Jumpbox2"
  memory        = 4096
  cpus          = 2
  cpu_cores     = 1


  network {
    type               = "vapp"
    name               = vcd_vapp_network.vappNet0.name
    ip_allocation_mode = "MANUAL"
    ip                 = "192.168.200.253"
    is_primary         = true
  }

  network {
    type               = "vapp"
    name               = vcd_vapp_network.vappNet1.name
    ip_allocation_mode = "MANUAL"
    ip                 = "192.168.1.253"
    is_primary         = false
  }

  network {
    type               = "vapp"
    name               = vcd_vapp_network.vappNet2.name
    ip_allocation_mode = "MANUAL"
    ip                 = "192.168.2.253"
    is_primary         = false
  }

  network {
    type               = "vapp"
    name               = vcd_vapp_network.vappNet3.name
    ip_allocation_mode = "MANUAL"
    ip                 = "192.168.3.253"
    is_primary         = false
  }

  depends_on    = [vcd_vapp.lab_template]
}