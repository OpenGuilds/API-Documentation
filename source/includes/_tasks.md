# Tasks

## The Task Object
> The Task object looks like this:

```json
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
  "connections": [
    {
      "object": "Connection",
      "source": "1",
      "target": "2"
    }
  ],
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

[Guilds](#the-guild-object) have a series of tasks they perform on each piece of data.

[Members](#the-member-object) subscribe to tasks to receive the tasks work.

To subscribe to a task, [members](#the-member-object) must have all the required 
qualifications, which can be created by going to the task page.

[Members](#the-member-object) perform work on data by transforming it through a
[workspace](#the-workspace-object).

Tasks are bound together through connections which are created on your
[guild](#the-guild-object) page.


The object has the following attributes:

Attribute | Type | Description
--------- | ---- | -----------
object | string | The object being described by the incoming data, in this case a Task
id | string | The ID of the task being returned.
minimum_amount | string | The minimum cost of a datum being processed through this task.
minimum_amount_cents | integer | The minimum cost of a datum being processed through this task in cents.
workspace | object | The connected workspace object for this task.
connections | object | A list of associated connection objects.


The Connection object has the following attributes:

Attribute | Type | Description
--------- | ---- | -----------
object | string | The object being described by the incoming data, in this case a Connection
source | string | The ID of the task used as the source of the data transfer.
target | string | The ID of the task used as the destination of the data transfer.

An inbound connection has the task object ID match the target ID, and an outbound
connection has the task ID match the source ID.


## List all Tasks
```ruby
require 'open-guilds'
OpenGuilds.api_key = '8641fb38-294a-41d9-9591-3449dfd99910'

#The guild ID is passed in as the first argument
OpenGuilds::Tasks.list(1)
```

```shell
curl "https://openguilds.com/api/guilds/<GUILD_ID>/tasks
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> The above command returns JSON structured like this:

```json
{
  "object": "List",
  "url": "/api/guilds/1/tasks",
  "has_more": "false",
  "data": [
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
      "connections": [
        {
          "object": "Connection",
          "source": "1",
          "target": "2"
        }
      ],
      "created": "2015-05-22T14:56:29.000Z",
      "updated": "2015-05-22T14:56:28.000Z"
    }
  ]
}

```

### HTTP Request

`GET http://openguilds.com/api/guilds/<GUILD_ID>/tasks`

### URL Parameters

Parameter | Description
--------- | -----------
GUILD_ID | The ID of the guild you want to view the tasks of


## Get a Task
```ruby
require 'open-guilds'
OpenGuilds.api_key = '8641fb38-294a-41d9-9591-3449dfd99910'

OpenGuilds::Task.get(1)
```

```shell
curl "https://openguilds.com/api/tasks/<ID>"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> The above command returns JSON structured like this:

```json
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
  "connections": [
    {
      "object": "Connection",
      "source": "1",
      "target": "2"
    }
  ],
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

### HTTP Request

`GET http://openguilds.com/api/tasks/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the task
