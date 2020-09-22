#!bin/bash

az login 

az group create -n blizzArmVscodeRG -l eastus2

az deployment group create -g blizzArmVscodeRG --template-file template.json --parameters parameters.json
