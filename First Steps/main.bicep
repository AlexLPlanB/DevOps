param name string = 'alexskleinewelt'
param location string = 'westeurope' 

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: name
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource blobConatiner 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = {
  name: '${name}/default/alexsblob'
}

output storageId string = storageAccount.id
