resource StaticStorageAccount 'Microsoft.Storage/storageAccounts@2022-09-01'={
  name: 'staticsitestorageaccount'
  location: 'resourceGroup().location'
  kind: 'BlobStorage'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
}

