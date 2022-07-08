# Passos depois da primeira execução

``` bash
$ export VAULT_ADDR=http://localhost:8200
$ vault operator init -key-shares=1 -key-threshold=1
```

Unseal Key 1: z4eTN0jBOerVmRqP0ralartRhRsBOevnnIYm/DNvOyU=

Initial Root Token: hvs.VSlxeCypMevB7HLAYZ1hB73L

``` bash
$ export VAULT_TOKEN=hvs.VSlxeCypMevB7HLAYZ1hB73L
$ vault operator unseal
$ vault secrets enable -path=secret/ kv
```