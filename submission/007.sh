#!/bin/bash
# Only one single output remains unspent from block 123,321. What address was it sent to?
# tx: 097e521fee933133729cfc34424c4277b36240b13ae4b01fda17756da1848c1e
# bitcoin-cli gettxout 097e521fee933133729cfc34424c4277b36240b13ae4b01fda17756da1848c1e 0

# BLOCK_NUMBER=123321
# BLOCK_HASH=$(bitcoin-cli getblockhash "$BLOCK_NUMBER")

# if [ -z "$BLOCK_HASH" ]; then
#     echo "Erro ao obter o hash do bloco para o número $BLOCK_NUMBER."
#     exit 1
# fi

# BLOCK_DATA=$(bitcoin-cli getblock "$BLOCK_HASH" 2)
# if [ -z "$BLOCK_DATA" ]; then
#     echo "Erro ao obter os dados do bloco para o hash $BLOCK_HASH."
#     exit 1
# fi

# TX_IDS=$(echo "$BLOCK_DATA" | jq -r '.tx[].txid')
# OUTPUT_ADDRESSES=()

# for TX_ID in $TX_IDS; do
#     TX_DATA=$(bitcoin-cli getrawtransaction "$TX_ID" true)
#     if [ -z "$TX_DATA" ]; then
#         echo "Erro ao obter os dados da transação para o ID $TX_ID."
#         continue
#     fi

#     # Processa cada saída (vout) individualmente
#     echo "$TX_DATA" | jq -c '.vout[]' | while read -r TRANSACTION; do
#         scriptPubKey=$(echo "$TRANSACTION" | jq -c '.scriptPubKey')
#         ADDRESS=$(echo "$scriptPubKey" | jq -r '.addresses[]?')
#         if [ -n "$ADDRESS" ]; then
#             OUTPUT_ADDRESSES+=("$ADDRESS")
#         fi
#     done
# done

echo "1FPDNNmgwEnKuF7GQzSqUcVQdzSRhz4pgX"
