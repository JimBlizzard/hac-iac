# readme.md

Notes from Tutorials > Beginner templates located here: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-create-first-template?tabs=azure-cli>

Naming convention for the deployment files will be ```azuredeploy.{step#}.json``` and ```azuredeploy.{step#}.parameters.json```

1. Create first template

```bash azure cli
az login
az account show #verify you're using the correct subscription

# create variables
rgName1="00000-blizz-tutorials-rg"
location="centralus"

echo $rgName1
echo $location

# create resource group
az group create \
  --name $rgName1 \
  --location $location

# deploy the template
templateFile="~/repos/hack-iac/arm-templates/tutorials/beginner-templates/azuredeploy.1.json"
az deployment group create \
  --name blanktemplate \
  --resource-group $rgName1 \
  --template-file $templateFile

# verify resources created properly then clean up resources
az group delete --name $rgName1

```

2. Add resource

Docs are here: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-add-resource?tabs=azure-cli>

```bash azure cli
# create variables
rgName="00000-blizz-tutorials-rg"
location="centralus"

echo $rgName
echo $location

# create resource group
az group create \
  --name $rgName \
  --location $location

# deploy the template
templateFile="~/repos/hack-iac/arm-templates/tutorials/beginner-templates/azuredeploy.2.json"
az deployment group create \
  --name addstorage \
  --resource-group $rgName \
  --template-file $templateFile

```

3. Add parameters

Docs are here: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-add-parameters?tabs=azure-cli>

```bash azure cli
# create variables
rgName="00000-blizz-tutorials-rg"
location="centralus"

echo $rgName
echo $location

# create resource group
az group create \
  --name $rgName \
  --location $location

templateFile="~/repos/hack-iac/arm-templates/tutorials/beginner-templates/azuredeploy.3.json"

az deployment group create \
  --name addnameparameter \
  --resource-group $rgName \
  --template-file $templateFile \
  --parameters storageName="blizzstg00001"

# change the storageSKU while creating a new storage account
az deployment group create \
  --name differentstoragesku \
  --resource-group $rgName \
  --template-file $templateFile \
  --parameters storageSKU=Standard_GRS storageName="blizzstg00002"

# try to use an invalid storageSKU
az deployment group create \
  --name invalidstoragesku \
  --resource-group $rgName \
  --template-file $templateFile \
  --parameters storageSKU=Standard_AAA storageName="blizzstg00002"

```

4. Add template functions

Docs are here: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-add-functions?tabs=azure-cli>

```bash azure cli
# create variables
rgName="00000-blizz-tutorials-rg"
location="centralus"

echo $rgName
echo $location

# create resource group
az group create \
  --name $rgName \
  --location $location

templateFile="~/repos/hack-iac/arm-templates/tutorials/beginner-templates/azuredeploy.4.json"

az deployment group create \
  --name addlocationparameter \
  --resource-group $rgName \
  --template-file $templateFile \
  --parameters storageName="blizzstg00001"

```

5. Add variables

Docs are here: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-add-variables?tabs=azure-cli>

```bash azure cli
# create variables
rgName="00000-blizz-tutorials-rg"
location="centralus"

echo $rgName
echo $location

# create resource group
az group create \
  --name $rgName \
  --location $location

templateFile="~/repos/hack-iac/arm-templates/tutorials/beginner-templates/azuredeploy.5.json"

az deployment group create \
  --name addnamevariable \
  --resource-group $rgName \
  --template-file $templateFile \
  --parameters storagePrefix=blizzstg01 storageSKU=Standard_LRS

```

6. Add outputs

Docs are here: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-add-outputs?tabs=azure-cli>

```bash azure cli
# create variables
rgName="00000-blizz-tutorials-rg"
location="centralus"

echo $rgName
echo $location

# create resource group
az group create \
  --name $rgName \
  --location $location

templateFile="~/repos/hack-iac/arm-templates/tutorials/beginner-templates/azuredeploy.6.json"

az deployment group create \
  --name addoutputs \
  --resource-group $rgName \
  --template-file $templateFile \
  --parameters storagePrefix=blizzstg01 storageSKU=Standard_LRS

```

7. Use exported template from the portal

Docs are here: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-export-template?tabs=azure-cli>

Create a template for a web app and use part of its contents to update the existing template from tutorial 6.

```bash azure cli

# create variables
rgName="00000-blizz-tutorials-rg"
location="centralus"

echo $rgName
echo $location

# create resource group
az group create \
  --name $rgName \
  --location $location

templateFile="~/repos/hack-iac/arm-templates/tutorials/beginner-templates/azuredeploy.7.json"

az deployment group create \
  --name addappserviceplan \
  --resource-group $rgName \
  --template-file $templateFile \
  --parameters storagePrefix=blizzstg01 storageSKU=Standard_LRS

```

8. Use Azure Quickstart templates

Docs are here: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-quickstart-template?tabs=azure-cli>

```bash azure cli

# create variables
rgName="00000-blizz-tutorials-rg"
location="centralus"

echo $rgName
echo $location

# create resource group
az group create \
  --name $rgName \
  --location $location

templateFile="~/repos/hack-iac/arm-templates/tutorials/beginner-templates/azuredeploy.8.json"

az deployment group create \
  --name addwebapp \
  --resource-group $rgName \
  --template-file $templateFile \
  --parameters storagePrefix=blizzstg01 storageSKU=Standard_LRS webAppName=blizzdemowebapp

```

9. Add tags to ARM template

Docs are here: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-add-tags?tabs=azure-cli>

```bash azure cli

# create variables
rgName="00000-blizz-tutorials-rg"
location="centralus"

echo $rgName
echo $location

# create resource group
az group create \
  --name $rgName \
  --location $location

templateFile="~/repos/hack-iac/arm-templates/tutorials/beginner-templates/azuredeploy.9.json"

az deployment group create \
  --name addtags \
  --resource-group $rgName \
  --template-file $templateFile \
  --parameters storagePrefix=blizzstg01 storageSKU=Standard_LRS webAppName=blizzdemowebapp

```
