param topics_MyDrasiTestEventGridTopicTwo_name string = 'MyDrasiTestEventGridTopicTwo'
param storageAccounts_jmfztestdrasi_externalid string = '/subscriptions/<id>/resourceGroups/<id>/providers/Microsoft.Storage/storageAccounts/<id>'

resource topics_MyDrasiTestEventGridTopicTwo_name_resource 'Microsoft.EventGrid/topics@2025-02-15' = {
  name: topics_MyDrasiTestEventGridTopicTwo_name
  location: 'eastus'
  identity: {
    type: 'None'
  }
  properties: {
    minimumTlsVersionAllowed: '1.2'
    inputSchema: 'CloudEventSchemaV1_0'
    publicNetworkAccess: 'Enabled'
    inboundIpRules: []
    disableLocalAuth: false
    dataResidencyBoundary: 'WithinRegion'
  }
}

resource topics_MyDrasiTestEventGridTopicTwo_name_test 'Microsoft.EventGrid/topics/eventSubscriptions@2025-02-15' = {
  parent: topics_MyDrasiTestEventGridTopicTwo_name_resource
  name: 'test'
  properties: {
    destination: {
      properties: {
        resourceId: storageAccounts_jmfztestdrasi_externalid
        queueName: 'fromdrasi'
        queueMessageTimeToLiveInSeconds: 604800
      }
      endpointType: 'StorageQueue'
    }
    filter: {
      enableAdvancedFilteringOnArrays: true
    }
    labels: []
    eventDeliverySchema: 'CloudEventSchemaV1_0'
    retryPolicy: {
      maxDeliveryAttempts: 30
      eventTimeToLiveInMinutes: 1440
    }
  }
}
