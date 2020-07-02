# terraform-vcd
## vault setup
* vault server -dev &
* export VAULT_ADDR='http://127.0.0.1:8200'
## Add username to log into vmware vcd
* vault kv put secret/gsduser gsduser=username
## Add password to log into vmware vcd 
* vault kv put secret/gsdpassword gsdpassword=password
## Run this to set the token id and add to variables.tf
* vault token lookup   # add token id variables.tf