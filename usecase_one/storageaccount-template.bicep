param storageAccounts_jmfztestdrasi_name string = 'jmfztestdrasi'

resource storageAccounts_jmfztestdrasi_name_resource 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: storageAccounts_jmfztestdrasi_name
  location: 'westeurope'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: false
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    allowSharedKeyAccess: true
    largeFileSharesState: 'Enabled'
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      requireInfrastructureEncryption: false
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource storageAccounts_jmfztestdrasi_name_default 'Microsoft.Storage/storageAccounts/blobServices@2024-01-01' = {
  parent: storageAccounts_jmfztestdrasi_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_jmfztestdrasi_name_default 'Microsoft.Storage/storageAccounts/fileServices@2024-01-01' = {
  parent: storageAccounts_jmfztestdrasi_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_jmfztestdrasi_name_default 'Microsoft.Storage/storageAccounts/queueServices@2024-01-01' = {
  parent: storageAccounts_jmfztestdrasi_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_jmfztestdrasi_name_default 'Microsoft.Storage/storageAccounts/tableServices@2024-01-01' = {
  parent: storageAccounts_jmfztestdrasi_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource storageAccounts_jmfztestdrasi_name_default_drasitest 'Microsoft.Storage/storageAccounts/queueServices/queues@2024-01-01' = {
  parent: Microsoft_Storage_storageAccounts_queueServices_storageAccounts_jmfztestdrasi_name_default
  name: 'drasitest'
  properties: {
    metadata: {}
  }
  dependsOn: [
    storageAccounts_jmfztestdrasi_name_resource
  ]
}

resource storageAccounts_jmfztestdrasi_name_default_fromdrasi 'Microsoft.Storage/storageAccounts/queueServices/queues@2024-01-01' = {
  parent: Microsoft_Storage_storageAccounts_queueServices_storageAccounts_jmfztestdrasi_name_default
  name: 'fromdrasi'
  properties: {
    metadata: {}
  }
  dependsOn: [
    storageAccounts_jmfztestdrasi_name_resource
  ]
}
