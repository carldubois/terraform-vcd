# Variables for VCD

variable "vcd_url" {
    description = "VCD URL"
    default = "https://vcloud.wwtatc.local/api"
}
variable "org" {
    description = "VCD Organization"
    default = "vCD-Perm"
}
variable "vdc" {
    description = "VCD VDC"
    default = "vCD-Perm-vApps"
}

variable "vault_addr" {
    description = "Vault Address"
    default = ""
}

variable "vcduser" {
    default = ""
}

variable "vcdpassword" {
    type = string
    default = ""
}

variable "token_id" {
    default = "s.qsflJKNKMre1ByjpY6gramaS"
}

variable "catalog" {
    default = "Perm-vApps"
}

variable "template_name" {
    default = "Nginx-Lab-Module-2.v2"
}