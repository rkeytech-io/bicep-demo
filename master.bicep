// Scope
targetScope = 'subscription'

var demoPrefix = 'back2base'
param currentTime string = utcNow()
var demoId = '${demoPrefix}-${uniqueString(subscription().subscriptionId)}-${currentTime}'

resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: demoId
  location: deployment().location
}

// Module
module demo '01-Basics/demo.bicep' = {
  name: demoId
  scope: rg
  params: {
    globalRedundancy: false
    demoId: demoPrefix
  }
}
