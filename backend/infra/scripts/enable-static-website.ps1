$storageAccount = Get-AzStorageAccount -ResourceGroupName AM55-Web-Staging

# Enable the static website feature on the storage account.
$ctx = $storageAccount.Context
Enable-AzStorageStaticWebsite -Context $ctx index.html