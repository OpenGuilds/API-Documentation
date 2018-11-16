# Guilds

## The Guild Object
> The Guild object looks like this:

```json
{
  "object": "Guild",
  "id": "1",
  "name": "Audio Transcription",
  "description": "This guild takes an audio file and returns a text transcription",
  "price_floor": "1.80",
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

Guilds are online organizations with a community of [members](#the-member-object).

Guilds are made up of many [tasks](#the-task-object) where [members](#the-member-object) process data by modifying it
through [workspaces](#the-workspace-object).

The object has the following attributes:

Attribute | Description
--------- | -----------
object | A string representing the object type.
id | The ID of the batch being returned.
name | The name of the guild.
description | A description of the guild.

## List all Guilds

Will return all guilds which an authorized user owns.

```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
api.guilds.list
```

```shell
curl "https://openguilds.com/api/guilds/<ID>"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> The above command returns JSON structured like this:

```json
{
  "object": "List",
  "url": "/api/guilds",
  "has_more": "false",
  "page": 1,
  "data": [
    {
      "object": "Guild",
      "id": "1",
      "name": "Audio Transcription",
      "description": "This guild takes an audio file and returns a text transcription",
      "created": "2015-05-22T14:56:29.000Z",
      "updated": "2015-05-22T14:56:28.000Z"
    }
  ]
}

```

### HTTP Request

`GET http://dashboard.openguilds.com/api/guilds`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the guild to retrieve

## Get a Guild
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
api.guilds.get(1)
```

```shell
curl "https://dashboard.openguilds.com/api/guilds/<ID>"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> The above command returns JSON structured like this:

```json
{
  "object": "Guild",
  "id": "1",
  "name": "Audio Transcription",
  "description": "This guild takes an audio file and returns a text transcription",
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}

```

### HTTP Request

`GET http://dashboard.openguilds.com/api/guilds/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the guild to retrieve


