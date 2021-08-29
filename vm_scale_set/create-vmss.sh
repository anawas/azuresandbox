az group create \
  --location westus \
  --name sya-cct-demo
  
az vmss create \
  --resource-group sya-cct-demo \
  --name webServerScaleSet \
  --image UbuntuLTS \
  --public-ip-address vm-public-ip \
  --public-ip-per-vm \
  --public-ip-address-allocation dynamic \
  --upgrade-policy-mode automatic \
  --custom-data cloud-init.yaml \
  --admin-username azureuser \
  --generate-ssh-keys
  