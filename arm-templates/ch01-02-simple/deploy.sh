#!bin/bash

# Script parameters
today=`date +%Y-%m-%d-%H-%M-%S`
deploymentName="MyDeployment-$today"

az login 

echo " "
echo "azure account is: "
az account show

echo "rg name?"
read resourceGroup

echo "location?"
read location

az group create --name $resourceGroup \
    --location $location \
    --debug

az deployment group create \
    --name $deploymentName \
    --resource-group $resourceGroup \
    --template-file azuredeploy.json \
    --parameters azuredeploy.parameters.json \
    --debug 
