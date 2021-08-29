group=sya-cct-demo
loc=westus

echo "Creating resource group..."
az group create \
  --location $loc \
  --name $group

echo "Creating vm..."
az vm create \
  --resource-group $group \
  --name myVM \
  --image UbuntuLTS \
  --admin-username azureuser \
  --generate-ssh-keys \
  --custom-data cloud-init.yaml \
  --verbose

echo "Opening ports on vm..."
az vm open-port \
  --resource-group $group \
  --name myVM \
  --port 80
