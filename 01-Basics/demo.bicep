// Parameters + Default Value + Expressions
param globalRedundancy bool
param location string = resourceGroup().location
param demoId string = 'bicep'

// Variable + Expressions
var containerNames = [
  'images'
  'videos'
  'pdf'
]

var storageAccountName = '${demoId}${uniqueString(resourceGroup().id)}'

// Resource
resource sa 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: globalRedundancy ? 'Standard_GRS' : 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

// Loops
resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-02-01' = [for containerName in containerNames: {
  name: '${sa.name}/default/${containerName}'
}]

// Output
output storageAccountName string = sa.name
