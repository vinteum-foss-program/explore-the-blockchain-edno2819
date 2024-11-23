# Which tx in block 257,343 spends the coinbase output of block 256,128?
# bitcoin-cli getblockhash 256128 -> 0000000000000007440fc4df4d953acbf67ad26adb2d7dff7bee90318b41e6c6
# bitcoin-cli getblock 0000000000000007440fc4df4d953acbf67ad26adb2d7dff7bee90318b41e6c6
#  "tx": [
#    "611c5a0972d28e421a2308cb2a2adb8f369bb003b96eb04a3ec781bf295b74bc",
# bitcoin-cli getrawtransaction 611c5a0972d28e421a2308cb2a2adb8f369bb003b96eb04a3ec781bf295b74bc true
# Adress Coinbase: 1HtUGfbDcMzTeHWx2Dbgnhc6kYnj1Hp24i
# bitcoin-cli getblockhash 257343 -> 0000000000000004f3fb306baa0638ffc181bc6b9752f9325612559c04d57bf9
# bitcoin-cli getblock 0000000000000004f3fb306baa0638ffc181bc6b9752f9325612559c04d57bf9
#!/bin/bash
# bitcoin-cli getrawtransaction 67aa86bfac08ef9e520b9c07f9062c332552d9654022932bd9b45daceff7c3d2 true

BLOCK_HASH="0000000000000004f3fb306baa0638ffc181bc6b9752f9325612559c04d57bf9"
TARGET_ADDRESS="1HtUGfbDcMzTeHWx2Dbgnhc6kYnj1Hp24i"

BLOCK_DATA=$(bitcoin-cli getblock "$BLOCK_HASH" 2)

TX_IDS=$(echo "$BLOCK_DATA" | jq -r '.tx[].txid')

skip=0
for TX_ID in $TX_IDS; do
    if [[ $skip -eq 0 ]]; then
        skip=1
        continue
    fi
    
    TX_DATA=$(bitcoin-cli getrawtransaction "$TX_ID" 2)

    if [[ $? -ne 0 || -z "$TX_DATA" ]]; then
        continue
    fi

    INPUTS=$(echo "$TX_DATA" | jq -c '.vin[]' 2>/dev/null)
    if [[ $? -ne 0 || -z "$INPUTS" ]]; then
        continue
    fi

    for INPUT in $INPUTS; do
        if echo "$INPUT" | grep -q "$TARGET_ADDRESS"; then
            echo "$TX_ID"
            exit 1
        fi
    done
done