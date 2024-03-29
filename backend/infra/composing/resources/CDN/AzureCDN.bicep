@description('Location for all resources.')
param location string = resourceGroup().location
param profileName string =  'am55cloudsite'

var endpointName = 'dev-web-endpoint'
var storageAccountHostName = replace(replace(StorageAccount.properties.primaryEndpoints.web, 'https://', ''), '/', '')

resource StorageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' existing = {
  name: 'devwebbuild${uniqueString(resourceGroup().id)}'  
}

resource cdnProfile 'Microsoft.Cdn/profiles@2021-06-01' existing  = {
  name: profileName
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
        name: 'origin'
        properties: {
          hostName: storageAccountHostName
        }
      }
    ]
  }
}

output hostName string = endpoint.properties.hostName
output originHostHeader string = endpoint.properties.originHostHeader
output storageAccountHostName string = StorageAccount.properties.primaryEndpoints.web
