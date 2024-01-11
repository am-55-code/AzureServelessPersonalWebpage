# Getting the Az Storage Name
name=$(az storage account list --resource-group AM55-Web-Staging --query "[0].name" --output tsv)

echo $name

# Getting the Blob Storage Container Name $web
container=$(az storage container list --account-name $name --query "[0].name" --output tsv)

echo $container

# Uploading files to blob Storage
az storage blob upload-batch --account-name $name --auth-mode key --destination $container --source ./ --overwrite