param location string = resourceGroup().location
param textToReplaceSubtitleWith string = 'Default Text'

resource appServicePlan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: 'NAME_OF_YOUR_SERVICEPLAN'
  location: location
  sku: {
    name: 'F1'
  }
  kind: 'app'
  properties: {
    reserved: false
  }
}

resource appService 'Microsoft.Web/sites@2023-01-01' = {
  name: 'NAME_OF_YOUR_WEB_APP'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      appSettings: [
        {
          name: 'TEXT_TO_REPLACE_SUBTITLE_WITH' 
          value: textToReplaceSubtitleWith
        }
        {
          name: 'SCM_DO_BUILD_DURING_DEPLOYMENT' 
          value: 'true'
        }
        {
          name: 'WEBSITE_NODE_DEFAULT_VERSION' 
          value: '~20'
        }
      ]
      publicNetworkAccess: 'Enabled'
    }
  }
}
