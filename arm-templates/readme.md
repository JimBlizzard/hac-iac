# Readme

## References

- See this excellent Sample ARM template architecture created by Adam P. It includes nested templates: <https://github.com/JimBlizzard/Azure-Sample-ARM-Template-Architecture>
- Tutorial: integrate **Key Vault** in your ARM template deployment: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-use-key-vault>
- **Accessing Key Vault secrets from ARM templates** (includes a good section / examples of nested templates): <https://www.linkedin.com/pulse/accessing-key-vault-secrets-from-arm-templates-paul-towler/>
- **Nest ARM templates**: <https://www.linkedin.com/pulse/nested-arm-templates-paul-towler/>
- **Set resource deployment order. Tutorial**: Create ARM templates with **dependent resources**: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-create-templates-with-dependent-resources?tabs=CLI>
- Use Azure Key Vault to pass secure parameter value during deployment of ARM template. Has an example of using **Static and Dynamic IDs**. **Dynamic IDs involves using a linked template**: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/key-vault-parameter?tabs=azure-cli>
- **Integrate key vault in your ARM template deployment**: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-use-key-vault>
- **ARM template extension for VS Code**: <https://marketplace.visualstudio.com/items?itemName=msazurermtools.azurerm-vscode-tools>
- **Use secrets from Azure Key Vault in Azure pipelines**: <https://docs.microsoft.com/en-us/azure/devops/pipelines/release/azure-key-vault?view=azure-devops>
- **Troubleshoot template deployment**: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-troubleshoot>
- **Key Vault usage examples**: <https://github.com/rjmax/ArmExamples/tree/master/keyvaultexamples>

## The hack

OpenHack docs: <https://github.com/microsoft/WhatTheHack/blob/master/011-InfraAsCode-ARM-DSC/Student>

See GitHub <https://github.com/JimBlizzard/hack-iac>

### How to create an ARM template from scratch in VS Code

Instructions from <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/quickstart-create-templates-use-visual-studio-code?tabs=CLI>

#### 1. Create an arm template

1. Create an ARM template - in an empty file named ```template.json```, type ```arm``` and select ```arm!``` to crate a template scoped for an Azure resource group deployment
1. Place the cursor in the template *resources* block, type in ```storage```, and select the *arm-storage* snippet.

#### 2. Add template parameters

1. Place your cursor in the **parameters block**, add a carriage return, type ```template```, and then select the new-parameter snippet. This action adds a generic parameter to the template.
1. Now, on the storage resource, **update the name property to use the parameter**. To do so, remove the current name. **Enter a double quote and an opening square bracket [**, which produces a list of ARM template functions. Select parameters from the list.
1. Entering **a single quote ' inside of the round brackets** produces a list of all parameters defined in the template, in this case, storageAccountName. Select the parameter

#### 3. Create a parameter file

1. The extension makes it easy to create a parameter file from your existing templates. To do so, right-click on the template in the code editor and select Select/Create Parameter File.
1. Select New > All Parameters > Select a name and location for the parameter file.
1. Now that the parameter file has been mapped to the template, the extension validates both the template and parameter file together. To see this validation in practice, add a two-character value to the storageAccountName parameter in the parameter file and save the file.

## Challenge 1 - hello world template

This is from WhatTheHack <https://github.com/microsoft/WhatTheHack/blob/master/011-InfraAsCode-ARM-DSC/Student/ARM-Challenge-01.md>

### Challenge 1 References

- Good guidance here: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/quickstart-create-templates-use-visual-studio-code?tabs=CLI>

## Challenge 2 - deploy a virtual network

From: <https://github.com/microsoft/WhatTheHack/blob/master/011-InfraAsCode-ARM-DSC/Student/ARM-Challenge-02.md>

### Challenge 2 References

- Handy CIDR reference: <https://ipduh.com/ip/cidr/?172.0.0.0/16>
- Azure quickstart templates (ARM): <https://github.com/Azure/azure-quickstart-templates>
- Azure ARM template reference: <https://docs.microsoft.com/en-us/azure/templates/>

## Challenge 3 - Open some ports

From: <https://github.com/microsoft/WhatTheHack/blob/master/011-InfraAsCode-ARM-DSC/Student/ARM-Challenge-03.md>

### Challenge 3 References

- Understanding ARM resource IDs: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-functions-resource#resourceid>

Rather than puzzling through all the JSON needed to create the network security group, subnet, etc, I used to the portal to create the resources and downloaded the template. Then I deleted the resource group and deployed it from a bash shell using the Azure CLI.

The ARM template downloaded from the portal contains an extra (and seemingly redundant) definition for the NSG security rules as an indepentent type at the resource root level. The security rules are embedded in the type definition for the NSG itself. I deleted the "independent" security rule definitions, leaving the defintions embedded in the NSG, and the template deployed the entire resource group successfully.

I've included both the modified template (template.json) and the original template that I downloaded from the portal (templateFromPortal.json) for reference.

## Challenge 4 - Secret values with Key Vault

From: <https://github.com/microsoft/WhatTheHack/blob/master/011-InfraAsCode-ARM-DSC/Student/ARM-Challenge-04.md>

### Description

Your challenge, should you accept it, is to:

- Create an Azure Key Vault and store a secret value in it by running one of the provided KeyVault scripts of your choice. You can find the scripts in the Resources folder for ARM-Challenge-04:

```txt
    create-key-vault-CLI.sh - Azure CLI
    create-key-vault-PS.ps1 - PowerShell
```

- Retrieve the secret value from Azure Key Vault and pass it into your template as a parameter without having the value exposed as plain text at any point in time!

I created this key vault: "vaultUri": "https://blizzarmvscodergkv.vault.azure.net/"

To get the metadata (such as id, location, etc) for a key vault, run something like this:

```bash
declare iacHackName="blizzarmrg"
declare vaultSuffix="kv"
declare iacHackVaultName="$iacHackName$vaultSuffix"
az keyvault show --name $iacHackVaultName -o json
```

#### Key Vault References

- Key Vault usage examples: <https://github.com/rjmax/ArmExamples/tree/master/keyvaultexamples>
- Integrate key vault in your ARM template deployment: <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-use-key-vault>

### Linked templates

```bash az cli

```
