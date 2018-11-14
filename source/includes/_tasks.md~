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
    "link": "api/workspaces/1"
    "preview": "https://preview.interface.com",
    "permissions": "open"
  },
  "connections": [
    {
      "object": "Connection"
      "source": "1",
      "target": "2"
    }
  ]
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

Tasks are the atomic units of work a [Guild](#the-guild-object) performs on incoming data.
[Members](#the-member-object) subscribe to tasks to receive work into their inboxes that they can
claim.

To subscribe to a Task, [Members](#the-member-object) must have all the required qualifications.

[Members](#the-member-object) perform work on data through a [Workspace](#the-workspace-object).

Tasks are bound together through connections.


The object has the following attributes:

Attribute | Description
--------- | -----------
object | The object being described by the incoming data, in this case a Task
id | The ID of the task being returned.
minimum_amount | The minimum cost of a datum being processed through this task.
minimum_amount_cents | The minimum cost of a datum being processed through this task in cents.
workspace | The connected workspace object for this task.
connections | A list of associated connection objects.


The Connection object has the following attributes:

Attribute | Description
--------- | -----------
object | The object being described by the incoming data, in this case a Connection
source | The ID of the task used as the source of the data transfer.
target | The ID of the task used as the destination of the data transfer.


## Get all Tasks
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
guild = api.guilds.get(1)
guild.tasks
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
      "workspace": { ... },
      "connections": [ ... ],
      "created": "2015-05-22T14:56:29.000Z",
      "updated": "2015-05-22T14:56:28.000Z"
    }
  ]
}

```

### HTTP Request

`GET http://openguilds.com/api/guild/<GUILD_ID>/tasks`

### URL Parameters

Parameter | Description
--------- | -----------
GUILD_ID | The ID of the guild you want to view the tasks of


## Get a Task
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
guild = api.guilds.get(1)
guild.tasks.get(1)
```

```shell
curl "https://openguilds.com/api/guilds/<GUILD_ID>/tasks/<ID>"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> The above command returns JSON structured like this:

```json
{
  "object": "Task",
  "id": "1",
  "minimum_amount": "$5.00",
  "minimum_amount_cents": 500,
  "workspace": { ... },
  "connections": [ ... ],
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

### HTTP Request

`GET http://openguilds.com/api/guild/<GUILD_ID>/tasks/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
GUILD_ID | The ID of the guild the task is from
ID | The ID of the task
