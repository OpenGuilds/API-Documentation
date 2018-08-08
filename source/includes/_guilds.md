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

Guilds are responsible for controlling the quality of their crowdsourcing
processes.

Guilds are made up of many Layers which process data with groupings of Tasks.

The object has the following attributes:

Attribute | Description
--------- | -----------
object | The object being described by the incoming data, in this case a Guild.
id | The ID of the batch being returned.
name | The name of the Guild.
description | A description of the Guild.
price_floor | The minimum you must pay to process one datum through the Guild.

## Get a Guild
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
api.guilds.get(1)
```

```shell
curl "https://openguilds.com/api/data/<ID>"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> The above command returns JSON structured like this:

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

### HTTP Request

`GET http://openguilds.com/api/guild/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the guild to retrieve


