param name string = 'NAME_OF_YOUR_Storage_Account'
param location string = 'YOUR_Location(z.B. westeurope)' 

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = { // Nutze immer die neuste Version
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
  name: '${name}/default/NAME_OF_YOUR_BLOB' // Bennene deinen Blob
}

output storageId string = storageAccount.id
