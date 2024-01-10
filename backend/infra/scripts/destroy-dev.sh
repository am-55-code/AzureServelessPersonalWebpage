# Getting the Az Storage Name
name=$(az storage account list --resource-group AM55-Web-Staging --query "[0].name" --output tsv)

# Deleting dev static website
az storage account delete --name $name -g AM55-Web-Staging --yes