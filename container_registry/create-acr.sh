source config.sh

echo "Creating resource group..."
az group create \
  --name $group \
  --location $loc

echo "Creating container registry..."
az acr create \
  --name exmanregistry \
  --resource-group $group \
  --location $loc \
  --sku Basic \
  --admin-enabled true
