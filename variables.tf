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

# To protect credentials, ensure all terraform.* files are in .gitignore
# This will prevent the credentials being replicated to the repository

# If using Vault for authentication, add the url of the Vault server

variable "vault_addr" {
    description = "Vault Address"
    #default = "http://10.255.68.57:8200"
    default = "http://127.0.0.1:8200"
}

# If using Environmental Variables for authentication to VCD

# Export your VCD Userid as an environmental variable
# export TF_VAR_vcduser=your_userid

variable "vcduser" {
    default = ""
}

# Export your VCD password as an environmental variable
# export TF_VAR_vcdpassword=your_password

variable "vcdpassword" {
    type = string
    default = ""
}

