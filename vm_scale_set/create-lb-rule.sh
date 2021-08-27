az network lb rule create \
  --resource-group sya-cct-demo \
  --name webServerLoadBalancerRuleWeb \
  --lb-name webServerScaleSetLB \
  --probe-name webServerHealth \
  --backend-pool-name webServerScaleSetLBBEPool \
  --backend-port 80 \
  --frontend-ip-name loadBalancerFrontEnd \
  --frontend-port 80 \
  --protocol tcp
