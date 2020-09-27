#!bin/bash

az login 

echo "Enter a project name. It will be used to generate resource group and resource names:"
read projectName
resourcGroupName="${projectName}rg"

today=`date +%Y-%m-%d-%H-%M-%S`
deploymentName="MyDeployment-$today"
location="Central US"

# create resource group
az group create \
  --name $resourcGroupName \
  --location $location



# deploy the ARM template
az deployment group create \
  --name            $deploymentName \
  --resource-group  $resourcGroupName \
  --template-file   deployarmtemplatewithdependencies.json \
  --parameters      deployarmtemplatewithdependencies.parameters.json \
  --mode            Incremental
