# Variables for VCD

variable "vcd_url" {
  type        = string
  description = "VCD URL"
  default     = "https://vcloud.wwtatc.local/api"
}
variable "org" {
  type        = string
  description = "VCD Organization"
  default     = "vCD-Perm"
}
variable "vdc" {
  type        = string
  description = "VCD VDC"
  default     = "vCD-Perm-vApps"
}

variable "vault_addr" {
  type        = string
  description = "Vault Address"
  default     = "http://127.0.0.1:8200"
}

variable "vcduser" {
  type    = string
  default = ""
}

variable "vcdpassword" {
  type    = string
  default = ""
}

variable "token_id" {
  type    = string
  default = ""
}

variable "catalog" {
  type    = string
  default = "Perm-vApps"
}

variable "template_name" {
  type    = string
  default = "Nginx-Lab-Module-2.v2"
}