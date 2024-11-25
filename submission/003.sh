# How many new outputs were created by block 123,456?
blockhash=$(bitcoin-cli getblockhash 123456)
blockinfo=$(bitcoin-cli getblock $blockhash)
txs=$(echo $blockinfo | jq -r '.tx[]')
total_outputs=0
for txid in $txs; do
    tx=$(bitcoin-cli getrawtransaction $txid true)
    num_outputs=$(echo $tx | jq '.vout | length')
    total_outputs=$((total_outputs + num_outputs))
done
echo ${total_outputs}
