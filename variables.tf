# Variables for VCD

variable "vcd_url" {
    description = "VCD URL"
    default = "https://vcloud.wwtatc.local/api"
}
variable "org" {
    description = "VCD Organization"
    default = "vCD-Sand"
}
variable "vdc" {
    description = "VCD VDC"
    default = "vCD-Sand-vApps"
}

variable "vault_addr" {
    description = "Vault Address"
    default = "http://127.0.0.1:8200"
}

variable "vcduser" {
    default = ""
}

variable "vcdpassword" {
    type = string
    default = ""
}

variable "token_id" {
    default = "s.VdwnQYMMJuHP07TtKHst9PsD"
}

variable "catalog" {
    default = "vCD-Sand Templates"
}

variable "template_name" {
    default = "Cisco-SDWAN-Sandbox-v2.3"
}