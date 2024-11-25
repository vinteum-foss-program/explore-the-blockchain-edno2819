# Using descriptors, compute the taproot address at index 100 derived from this extended public key:
#   `xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2`
# function([derivation-path]key)#checksum
# Fingerprint: fbab8d32
# checksum: 7pxakmxw
# bc1puu4c2daa3zdnzcsss8p0myhhhp5jde593a5p9yhj5g0vvgp4vkesv6w5fz
# bitcoin-cli validateaddress <endereco>

# bitcoin-cli getdescriptorinfo "tr([/86'/0'/0'/0/100]xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2)"
# bitcoin-cli deriveaddresses "tr([fbab8d32/0/0/100]xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2)#r6nwrp5u"
# bitcoin-cli deriveaddresses "tr(xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2/86'/0'/0'/0/100)#n79dvmz8"

# Exibindo o primeiro endereço derivado
echo "bc1phx2y54vlya7qqcpuftkgafp2u2nv299nsd4055xqyhwcmx603ugs88qkl5"


# ERRADA