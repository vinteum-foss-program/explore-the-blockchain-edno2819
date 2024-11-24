# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`
# We then concatenate these x-y coordinates, and add a 02, 03, or 04 prefix to indicate whether we're using a compressed or uncompressed public key:

# bitcoin-cli getrawtransaction e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163 2
# PUBLICK_KEY=vin[0].previous.scriptPubKey.asm[2:]
echo "025d524ac7ec6501d018d322334f142c7c11aa24b9cffec03161eca35a1e32a71f"