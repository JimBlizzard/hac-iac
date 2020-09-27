#!bin/bash

# Test the storage template 

# az login

echo "Resource group to use / create?"
read resourceGroup
today=`date +%Y-%m-%d-%H-%M-%S`
deploymentName="MyDeployment-$today"
location="centralus"

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