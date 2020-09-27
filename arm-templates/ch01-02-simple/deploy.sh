#!bin/bash

az login 

az group create -n blizz-arm-vscode -l eastus2

az deployment group create -g blizz-arm-vscode --template-file azuredeploy.json --parameters azuredeploy.parameters.json
