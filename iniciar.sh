vault server -config=vault-config.hcl &
sleep 10
if [ ! -z "$VAULT_UNSEAL_TOKEN" ]; then
vault operator unseal $VAULT_UNSEAL_TOKEN
fi

tail -f /dev/null