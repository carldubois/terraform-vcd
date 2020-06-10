# terraform-vcd
## vault setup
vault server -dev & \n
export VAULT_ADDR='http://127.0.0.1:8200' \n
vault kv put secret/gsd gsduser=<username> \n
vault kv put secret/gsd gsdpassword=<password> \n
vault token lookup # add token id variables.tf
