@description('Specifies the name of the Azure Storage account.')
param storageAccountName string = 'devwebbuild${uniqueString(subscription().id)}'

@description('Specifies the location in which the Azure Storage resources should be deployed.')
param location string = resourceGroup().location

@description('Specifies the name of the blob container.')
param containerName string = '$web'

// Creating a Storage Account
resource StorageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
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

resource Container 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = {
  name: '${storageAccountName}/default/${containerName}'
  dependsOn: [
      StorageAccount
  ]  
}  

output storageaccount object  = StorageAccount.properties.primaryEndpoints
