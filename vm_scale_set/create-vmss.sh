az group create \
  --location westus \
  --name sya-cct-demo
  
az vmss create \
  --resource-group sya-cct-demo \
  --name webServerScaleSet \
  --image UbuntuLTS \
  --upgrade-policy-mode automatic \
  --custom-data cloud-init.yaml \
  --admin-username azureuser \
  --generate-ssh-keys
  