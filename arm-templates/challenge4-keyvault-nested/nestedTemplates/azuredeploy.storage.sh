#!bin/bash

# Test the storage template 

# az login

# variables
today=`date +%Y-%m-%d-%H-%M-%S`
deploymentName="MyDeployment-$today"

echo "rg name?"
read resourceGroup

echo "location?"
read location


# create resource group
az group create \
  --name      $resourceGroup \
  --location  $location

# deploy the template
az deployment group create \
  --name                 $deploymentName \
  --resource-group       $resourceGroup \
  --template-file        azuredeploy.storage.json \
  --parameters           @azuredeploy.storage.parameters.json  