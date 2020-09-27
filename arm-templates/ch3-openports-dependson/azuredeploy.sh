#!bin/bash

az login 

echo "rg name?"
read RG

az group create \
  -n $RG \
  -l eastus2

az deployment group create \
  -g              $RG \
  --template-file azuredeploy.json \
  --parameters    azuredeploy.parameters.json
