# Using descriptors, compute the taproot address at index 100 derived from this extended public key:
#   `xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2`
# bitcoin-cli validateaddress <endereco>
# function([derivation-path]key)#checksum
# Fingerprint: fbab8d32
# checksum: 7pxakmxw
# bc1puu4c2daa3zdnzcsss8p0myhhhp5jde593a5p9yhj5g0vvgp4vkesv6w5fz

# bitcoin-cli getdescriptorinfo "tr([fbab8d32/0'/0'/100']xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2)"
# bitcoin-cli deriveaddresses "tr([fbab8d32/0'/0'/100']xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2)#{checksum}"

# Definições iniciais
XPUB="xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2"
FINGERPRINT="fbab8d32"
DERIVATION_PATH="0'/0'/100'"

# Construção do descriptor base
DESCRIPTOR="tr([$FINGERPRINT/$DERIVATION_PATH]$XPUB)"

# Obtendo o checksum usando bitcoin-cli
DESCRIPTOR_INFO=$(bitcoin-cli getdescriptorinfo "$DESCRIPTOR")
CHECKSUM=$(echo "$DESCRIPTOR_INFO" | jq -r '.checksum')

# Validando o checksum
if [ -z "$CHECKSUM" ]; then
  echo "Erro: Não foi possível obter o checksum do descriptor."
  exit 1
fi

# Construindo o descriptor completo com checksum
DESCRIPTOR_WITH_CHECKSUM="${DESCRIPTOR}#$CHECKSUM"

# Derivando o endereço Taproot no índice 100
ADDRESS=$(bitcoin-cli deriveaddresses "$DESCRIPTOR_WITH_CHECKSUM")
if [ -z "$ADDRESS" ]; then
  echo "Erro: Não foi possível derivar o endereço Taproot."
  exit 1
fi
# Extraindo o primeiro endereço do resultado (caso seja um array em JSON)
FIRST_ADDRESS=$(echo "$ADDRESS" | jq -r '.[0]')

# Exibindo o primeiro endereço derivado
echo "$FIRST_ADDRESS"


# ERRADA