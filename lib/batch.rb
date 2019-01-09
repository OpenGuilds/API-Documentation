module BatchHelper
  def batch
    {
      object: "Batch",
      id: "1",
      data_completed_count: "0",
      data_count: "1",
      data: list_for([datum(1), datum(2), datum(3)], 'api/batch/1/data'),
      webhooks: list_for(webhook, 'api/batch/1/webhooks'),
      dataset_destinations: list_for(dataset, 'api/batch/1/datasets'),
      completed: "false",
      status: "processing",
      created: "2015-05-22T14:56:29.000Z",
      updated: "2015-05-22T14:56:28.000Z"
    }
  end

  def datum(id = 1)
    {
      object: "Datum",
      id: "#{id}",
      status: "processing",
      parameters: {
        image_url: "www.images.com/image#{id}.png"
      }
    }
  end

  def webhook
    {
      object: "Webhook",
      id: "1",
      destination: "https://your.service.com"
    }
  end
end
