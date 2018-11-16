# Batches
## The Batch Object

> The Batch object looks like this:

```json
{
  "object": "Batch",
  "id": "1",
  "data_completed_count": "0",
  "data_count": "1"
  "data": [
    {
      "object": "datum",
      "id": "1",
      "status": "processing",
      "parameters": {
        "image_url": "www.images.com/image1.png"
      }
    },
  ],
  "webhooks": [
    {
      "object": "webhook",
      "id": "1",
      "destination": "https://your.service.com"
    }
  ],
  "completed": "false",
  "status": "processing",
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

Batches are created when you send [data](#the-datum-object)
to a [guild](#the-guild-object).

Batches can have many webhooks. Webhooks will send the
data from a batch to its endpoint when the batch status changes to completed.

Batches must be funded before they are given to guild 
[members](#the-member-object) to work on.

Funding a batch will allow workers to claim work from [tasks](#the-task-object)
they are subscribed to, which will add transformations to the data of the batch.


The object has the following attributes:

Attribute | Type | Description
--------- | ---- | -----------
object | string | The object's type. Objects of the same type have the same structure.
id | string | The ID of the batch being returned.
data_completed_count | integer | A count of all completed data in the batch.
data_count | integer | A count of all data in the batch.
data | object | The data objects associated with a given batch.
webhooks | array[webhooks] | An array of webhook objects.
status | string | A status describing the current state of the batch.

The status of a batch object can be one of the following:

Status | Description
------ | -----------
unpaid | The batch as not yet been funded.
processing | Not all data in the batch has been completed.
completed | All data in the batch has been processed and marked as complete.


## The Datum Object

The singular word for data is called a datum.

A datum is given to each task and held until workers perform the required work.

When a worker submits their work, new parameters the worker has created are
added to a datum and it is opened to the next task through a connection.


The data object has the following attributes:

Attribute | Type | Description
--------- | ---- | -----------
object | string | The object's type. Objects of the same type have the same structure.
id | string | The ID of the datum being returned.
status | string | A status describing the current state of the datum.
parameters | object | A hash structure of the given parameters and those added by workers.

The status of a datum object can be one of the following:

Status | Description
------ | -----------
processing | The data has not been processed by all required tasks.
completed | The data has been processed by all required tasks.

## The Webhook Object

A webhook is triggered when a batch object is completed.

It will send a JSON call to its destination with a secret key you create to
verify its origin.

The data object has the following attributes:

Attribute | Type | Description
--------- | ---- | -----------
destination | string | A valid http url.
secret | object | A secret you keep to verify its origin.

<aside class="notice">
Note that the secret will not be returned in any get request. It is only sent
when delivering the batch payload to its destination.
</aside>

## Create a Batch

Creating a batch is as simple as specifying the data you want to use for the
initial task as well as the destinations for the data when it is completed.

```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
guild = api.guilds.get(1)
guild.batches.create!(
  data: File.open('path/to/data.json')
)
```

```shell
curl "https://openguilds.com/api/guild/<GUILD_ID>/batch"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
  -H "Content-Type: application/json" 
  -d "@data.json"
```

> If we have a guild with only one input parameter with a key value of
> "image_url".

> Then your data.json file should look like:

```json
{
  "batch": {
    "data": [
      { "image_url": "www.images.com/image1.png", },
      { "image_url": "www.images.com/image2.png", },
      { "image_url": "www.images.com/image3.png", },
    ],
    "webhooks": [
      {
        "destination": "https://your.service.com", 
        "secret": "secret123",
      },
    ]
  }
}
```
> Each key value within the "data" array should match the required input
> parameters for the Guild.

> Which should return your batch:

```json
{
  "object": "Batch",
  "id": "1",
  "data_count": 3,
  "data_completed_count": 0,
  "status": "processing",
  "data": [
    {
      "object": "datum",
      "id": "1",
      "status": "processing",
      "parameters": {
        "image_url": "www.images.com/image1.png"
      }
    },
    {
      "object": "datum",
      "id": "2",
      "status": "processing",
      "parameters": {
        "image_url": "www.images.com/image2.png"
      }
    },
    {
      "object": "datum",
      "id": "3",
      "status": "processing",
      "parameters": {
        "image_url": "www.images.com/image3.png"
      }
    }
  ],
  "webhooks": [
    {
      "object": "webhook",
      "id": "1",
      "destination": "https://your.service.com"
    }
  ],
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

### HTTP Request

`POST http://openguilds.com/api/<GUILD_ID>/batches`

### Batch Parameters

Parameter | Type | Description
--------- | ---- | -----------
batch | object | The root key for the object, should contain "data" and "webhooks".
data | array | An array of objects matching the guilds API.
webhooks | array | An array of webhook objects with endpoints and secrets.


### URL Parameters

Parameter | Description
--------- | -----------
GUILD_ID | The ID of the guild the batch should be for.


## List all Batches
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
api.batches.get
```

```shell
curl "https://openguilds.com/api/guilds"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> The above command returns JSON structured like this:

```json
{
  "object": "List",
  "url": "/api/batches",
  "has_more": "false",
  "page": 1,
  "data": [
    {
      "object": "Batch",
      "id": "1",
      "data_count": 3,
      "data_completed_count": 0,
      "data": [ ... ],
      "webhooks": [ ... ],
      "status": "processing",
      "created": "2015-05-22T14:56:29.000Z",
      "updated": "2015-05-22T14:56:28.000Z"
    }
  ]
}
```

This will retrieve all batches for the authorized user.

### HTTP Request

`GET http://openguilds.com/api/batches`

## Get a Specific Batch

```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
api.batches.get(1)
```

```shell
curl "https://openguilds.com/api/batches/1"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> The above command returns JSON structured like this:

```json
{
  "object": "Batch",
  "id": "1",
  "data_count": 3,
  "data_completed_count": 0,
  "status": "processing",
  "data": [ ... ],
  "webhooks": [ ... ],
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

### HTTP Request

`GET http://example.com/batches/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the batch to retrieve

## Cancel a Specific Batch
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
api.batches.delete(1)
```

```shell
curl "https://openguilds.com/api/batches/1"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
  -X DELETE
```

> The above command returns JSON structured like this:

```json
{
  "object": "Batch",
  "id": "1",
  "canceled": true
}
```

Canceling a batch is made with a delete request. We delete the contents of the
batch but keep a record of it being canceled.

Refunds will be given for data that have not yet been accepted by [members](#the-member-object).

### HTTP Request

`DELETE https://openguilds.com/batches/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the batch to cancel


## Pay for a Batch
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
api.batches.pay(1)
```

```shell
curl "https://openguilds.com/api/batches/<ID>/debits"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> The above command returns JSON structured like this:

```json
{
  "object": "Transaction",
  "id": 2,
  "type": "Guild Debit",
  "amount" : "$2.00",
  "amount_cents": 200,
}
```

You can pay for a Batch by creating a guild debit [transaction](#the-transaction-object).

### HTTP Request

`POST http://openguilds.com/api/batches/<ID>/debits`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the Batch to retrieve
