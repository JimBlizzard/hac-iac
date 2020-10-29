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

```
