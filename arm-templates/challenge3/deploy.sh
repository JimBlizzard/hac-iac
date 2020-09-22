#!bin/bash

az login 

az group create -n blizz-arm-vscode -l eastus2

az deployment group create -g blizz-arm-vscode --template-file template.json --parameters parameters.json
