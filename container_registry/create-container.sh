source config.sh

az group create -g $group --location $loc

for ((i=0; i<1; ++i))
do 
    az container create \
    --resource-group $group  \
    --name mycontainer$i \
    --image exmanregistry.azurecr.io/exman-packer:1.1 \
    --registry-password "" \
    --registry-username "" \
    --ip-address public
done
