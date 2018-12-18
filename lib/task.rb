module TaskHelper
  def task
    {
      "object": "Task",
      "id": "1",
      "minimum_amount": "$5.00",
      "minimum_amount_cents": 500,
      "workspace": {
        "name": "Audio Transcription Interface",
        "link": "api/workspaces/1",
        "preview": "https://preview.interface.com",
        "permissions": "open"
      },
      "connections": list_for([connection], '/api/task/1/connections'),
      "created": "2015-05-22T14:56:29.000Z",
      "updated": "2015-05-22T14:56:28.000Z"
    }
  end

  def connection
    {
      "object": "Connection",
      "source_id": "1",
      "target_id": "2"
    }
  end
end
