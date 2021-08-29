echo "Creating load balancer health probe..."
az network lb probe create \
  --lb-name webServerScaleSetLB \
  --resource-group sya-cct-demo \
  --name webServerHealth \
  --port 80 \
  --protocol Http \
  --path /
  
  