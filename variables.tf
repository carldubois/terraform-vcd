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

# To protect credentials, ensure all terraform.* files are in .gitignore
# This will prevent the credentials being replicated to the repository

# If using Vault for authentication, add the url of the Vault server

variable "vault_addr" {
    description = "Vault Address"
    default = "http://127.0.0.1:8200"
}

variable "vcduser" {
    default = "duboisc"
}

variable "vcdpassword" {
    type = string
    default = "0696Cdd!ALec4Abbey"
}

variable "token_id" {
    default = "s.eNyNmcDXaJyNr9VLAffKiikG"
}

variable "catalog" {
    default = "vCD-Sand Templates"
}

variable "template_name" {
    default = "Cisco-SDWAN-Sandbox-v2.3"
}