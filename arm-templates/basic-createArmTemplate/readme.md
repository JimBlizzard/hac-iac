# readme.md

This is from the "Create templates - VS Code" quickstart located here: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/quickstart-create-templates-use-visual-studio-code?tabs=CLI>

```bash
az group create \
  --name 000-blizz-arm-vscode \
  --location eastus

az deployment group create \
  --resource-group 000-blizz-arm-vscode \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json

# Clean up resources
az group delete --name 000-blizz-arm-vscode
```
