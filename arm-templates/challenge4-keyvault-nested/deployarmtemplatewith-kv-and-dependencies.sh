#!bin/bash

az login 

# Script parameters 
rg="000blizzArmWithDependenciesRG"
location="eastus2"
today=`date +%Y-%m-%d-%H-%M-%S`
deploymentName="MyDeployment-$today"


# Create resource group 
az group create \
  --name      $rg \
  --location  $location 


# deploy the ARM template
az deployment group create \
  --name            $deploymentName \
  --resource-group  $rg \
  --template-file   deployarmtemplatewithdependencies.json \
  --parameters      deployarmtemplatewithdependencies.parameters.json \
  --mode            Incremental
