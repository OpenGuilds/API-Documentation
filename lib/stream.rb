module StreamHelper
  def stream
    {
      object: "Stream",
      id: "3",
      connections: list_for(
        [entry_connection, task_connection],
        'api/stream/2'
      ),
      created: "2015-05-22T14:56:29.000Z",
      updated: "2015-05-22T14:56:28.000Z"
    }
  end

  def entry_connection
    {
      object: "Connection",
      id: "1",
      source_id: "3",
      source_type: "Stream",
      target_id: "2",
      target_type: "Task",
      created: "2015-05-22T14:56:29.000Z",
      updated: "2015-05-22T14:56:28.000Z"
    }
  end

  def task_connection
    {
      object: "Connection",
      id: "1",
      source_id: "2",
      source_type: "Task",
      target_id: "4",
      target_type: "Task",
      created: "2015-05-22T14:56:29.000Z",
      updated: "2015-05-22T14:56:28.000Z"
    }
  end
end
