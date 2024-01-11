@description('Specifies the name of the Azure Storage account.')
param storageAccountName string = 'devwebbuild${uniqueString(resourceGroup().id)}'

@description('Specifies the name of the blob container.')
param containerName string = '$web'

@description('Specifies the location in which the Azure Storage resources should be deployed.')
param location string = resourceGroup().location

// Creating a Storage Account
resource DevStorageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

// Creating a container with the name $web
resource DevContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-05-01' = {
  name: '${storageAccountName}/default/${containerName}'
}
  

output storageaccount object  = DevStorageAccount.properties.primaryEndpoints
