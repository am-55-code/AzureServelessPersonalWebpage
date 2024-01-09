@description('Location for all resources.')
param location string = resourceGroup().location
param profileName string =  'am55cloudsite'

var endpointName = 'endpoint-${uniqueString(resourceGroup().id)}'
var storageAccountHostName = replace(replace(StorageAccount.properties.primaryEndpoints.blob, 'https://', ''), '/', '')

resource StorageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' existing = {
  name: 'dev-am55-build-${uniqueString(resourceGroup().id)}'  
}

resource cdnProfile 'Microsoft.Cdn/profiles@2021-06-01' = {
  name: profileName
  location: location
  tags: {
    displayName: profileName
  }
  sku: {
    name: 'Standard_Microsoft'
  }
}

resource endpoint 'Microsoft.Cdn/profiles/endpoints@2021-06-01' = {
  parent: cdnProfile
  name: endpointName
  location: location
  tags: {
    displayName: endpointName
  }
  properties: {
    originHostHeader: storageAccountHostName
    isHttpAllowed: true
    isHttpsAllowed: true
    queryStringCachingBehavior: 'IgnoreQueryString'
    contentTypesToCompress: [
      'text/plain'
      'text/html'
      'text/css'
      'application/x-javascript'
      'text/javascript'
    ]
    isCompressionEnabled: true
    origins: [
      {
        name: 'origin1'
        properties: {
          hostName: storageAccountHostName
        }
      }
    ]
  }
}

output hostName string = endpoint.properties.hostName
output originHostHeader string = endpoint.properties.originHostHeader
output storageAccountHostName string = StorageAccount.properties.primaryEndpoints.blob
