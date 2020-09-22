#!bin/bash

az login 

az group create -n blizzArmVsCodeRG -l eastus2

az deployment group create -g blizzArmVsCodeRG --template-file template.json --parameters parameters.json
