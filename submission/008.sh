# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`

# echo "025d524ac7ec6501d018d322334f142c7c11aa24b9cffec03161eca35a1e32a71f"

TRANSACTION_JSON=$(bitcoin-cli getrawtransaction e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163 2)

WITNESS_FIELD=$(echo "$TRANSACTION_JSON" | jq -r '.vin[0].txinwitness[2]')

PUBLIC_KEY=${WITNESS_FIELD:4:66}

echo "$PUBLIC_KEY"
