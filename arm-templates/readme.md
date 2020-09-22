# Readme

OpenHack docs: <https://github.com/microsoft/WhatTheHack/blob/master/011-InfraAsCode-ARM-DSC/Student>

See GitHub <https://github.com/JimBlizzard/hack-iac>

### How to create an ARM template from scratch in VS Code

Instructions from <https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/quickstart-create-templates-use-visual-studio-code?tabs=CLI>

#### 1. Create an arm template

1. Create an ARM template - in an empty file named ```template.json```, type ```arm``` and select ```arm!``` to crate a template scoped for an Azure resource group deployment
1. Place the cursor in the template *resources* block, type in ```storage```, and select the *arm-storage* snippet.

#### 2. Add template parameters

1. Place your cursor in the **parameters block, add a carriage return, type "**template, and then select the new-parameter snippet. This action adds a generic parameter to the template.
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
