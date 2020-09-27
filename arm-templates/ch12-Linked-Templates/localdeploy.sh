#!bin/bash

az login 

# Script parameters 
today=`date +%Y-%m-%d-%H-%M-%S`
deploymentName="MyDeployment-$today"

echo "Enter a project name. It will be used to generate resource group and resource names:"
read projectName
resourceGroupName="${projectName}rg"

echo "Enter the template file path and file name:"
read templateFile

az group create \
  --name $resourceGroupName \
  --location "Central US"

# deploy the ARM template
az deployment group create \
  --name           $deploymentName \
  --resource-group $resourceGroupName \
  --template-file  $templateFile \
  --parameters     projectName=$projectName \
  --mode           Incremental \
  --verbose
