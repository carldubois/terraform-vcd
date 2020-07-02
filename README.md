# terraform-vcd
## Setup

### Initialize terraform providers and modules
`terraform init`
### Run vault server in the background 
`vault server -dev &`
### Export VAULT_ADDR, run locally
`export VAULT_ADDR='http://127.0.0.1:8200'`
### Add username to log into vmware vcd
`vault kv put secret/gsduser gsduser=username`
### Add password to log into vmware vcd 
`vault kv put secret/gsdpassword gsdpassword=password`
### Run this to set the token id and add to variables.tf
`vault token lookup`