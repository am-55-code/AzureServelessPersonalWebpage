# Getting the Az Storage Name
name=$(az storage account list --resource-group AM55-Web-Prod --query "[0].name" --output tsv)

# Getting the Blob Storage Container Name $web
container=$(az storage container list --account-name $name --query "[0].name" --output tsv)

# Upload Changes to Storage account
az storage blob upload-batch --account-name $name --auth-mode key -d $container -source ./ --overwrite

# Purge CDN Endpoint to replicate new changes
 az cdn endpoint purge --content-paths  "/*" --profile-name "prdwebam55profile" --name "webprodam55" --resource-group "AM55-Web-Prod"