# Batches

## The Batch Object
Batches are created when you send data to a guild.

They hold information about groupings of data, which are used to prioritize
which pieces of data get completed by a guild at any given time.

When you create a Batch, it is unpaid. Guilds will not work
on Contracts which are unpaid to a price floor they set.

A Batch must be created for a specific Guild.

Once created the Batch is set to unpaid.

You can pay for a Batch by creating a payment for it.

When a Batch has been paid for it is sent to the Guild's queue to be processed.


> The Batch object looks like this:

```json
{
  "object": "batch",
  "id": "1",
  "fraction_completed": "5/10",
  "completed": "false",
  "status": "processing",
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

## Get All Batches

This will retrieve all batches for the authorized user.

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
  "object": "batches",
  "url": "/api/batches",
  "has_more": "false",
  "data": [
    {
      "id": "1",
      "fraction_completed": "5/10",
      "completed": "false",
      "status": "processing",
      "created": "2015-05-22T14:56:29.000Z",
      "updated": "2015-05-22T14:56:28.000Z"
    }
  ]
}
```

This endpoint retrieves all batches.

### HTTP Request

`GET http://example.com/api/batches`

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
  "object": "batch",
  "id": "1",
  "fraction_completed": "5/10",
  "completed": "false",
  "status": "processing"
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
  "relationships": [
    "user": {
      "id": "42",
      "type": "user"
    }
  ]
  "data": [{...data...}]
}
```

This endpoint retrieves a specific batch.

### HTTP Request

`GET http://example.com/batches/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the batch to retrieve

## Cancel a Specific Batch

Canceling a batch is made with a delete request. We delete the contents of the
batch but keep a record of it being canceled.

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
  "object": "batch",
  "id": 2,
  "canceled" : "true"
}
```

This endpoint cancels a specific batch.

### HTTP Request

`DELETE https://openguilds.com/batches/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the batch to cancel
