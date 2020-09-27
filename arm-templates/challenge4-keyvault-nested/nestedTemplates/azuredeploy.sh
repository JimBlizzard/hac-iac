#!bin/bash

# Login
az login


# Script parameters
today=`date +%Y-%m-%d-%H-%M-%S`
deploymentName="MyDeployment-$today"

echo "rg name?"
read resourceGroup

echo "location?"
read location

# Create resource group
az group create \
  --name        $resourceGroup \
  --location    $location

# Deploy the ARM template
az group deployment create \
  --name                 $deploymentName \
  --resource-group       $resourceGroup \
  --template-file        azuredeploy.json \
  --parameters           @azuredeploy.parameters.json \
  --mode                 Incremental
