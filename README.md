# terraform-vcd
## vault setup
* vault server -dev &
* export VAULT_ADDR='http://127.0.0.1:8200'
* vault kv put secret/gsduser gsduser=username
* vault kv put secret/gsdpassword gsdpassword=password
* vault token lookup   # add token id variables.tf