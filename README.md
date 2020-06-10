# terraform-vcd
## vault setup
* vault server -dev &
* export VAULT_ADDR='http://127.0.0.1:8200'
* vault kv put secret/gsd gsduser=username
* vault kv put secret/gsd gsdpassword=password
* vault token lookup   # add token id variables.tf