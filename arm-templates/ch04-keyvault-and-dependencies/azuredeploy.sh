#!bin/bash

az login 

# Script parameters 
today=`date +%Y-%m-%d-%H-%M-%S`
deploymentName="MyDeployment-$today"

echo "rg name?"
read rg

echo "location?"
read location 

# Create resource group 
az group create \
  --name      $rg \
  --location  $location 


# deploy the ARM template
az deployment group create \
  --name            $deploymentName \
  --resource-group  $rg \
  --template-file   azuredeploy.json \
  --parameters      azuredeploy.parameters.json \
  --mode            Incremental
