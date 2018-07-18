# Batches

## The Batch Object
Batches are created when you send data to a guild.

They hold information about groupings of data, which are used to prioritize
which pieces of data get completed by a guild at any given time.

When you create a Batch, it is unpaid. Guilds will not work
on Contracts which are unpaid to a price floor they set.

> The Batch object looks like this:

```json
{
  "object": "Batch",
  "id": "1",
  "fraction_completed": "5/10",
  "completed": "false",
  "status": "processing",
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```
The object has the following attributes:

Attribute | Description
--------- | -----------
object | The object being described by the incoming data, in this case a Batch.
id | The ID of the batch being returned
fraction_completed | The number of data completed out of the total number in the batch.
completed | Returns true if the batch data is all completed, otherwise false.
status | A status describing the current state of the batch.


The status of a batch object can be one of the following:

Status | Description
--------- | -----------
Processing | Not all data in the batch has been completed.
Completed | All data in the batch has been processed and marked as complete.

## Create a Batch

A Batch must be created for a specific Guild.

Once created the Batch is set to unpaid.

You can pay for a Batch by creating a payment for it.

When a Batch has been paid for it is sent to the Guild's queue to be processed.

```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
api.batches.get
```

```shell
curl "https://openguilds.com/api/batch"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
  -H "Content-Type: application/json" 
  -d "@data.json"
```

> Your data.json file should look like:

```json
{
  "data": [
    { "image_url": "www.images.com/image1.png" },
    { "image_url": "www.images.com/image2.png" }
  ]
}
```

> Which should return your batch:

```json
{
  "object": "Batch",
  "id": "1",
  "fraction_completed": "0/2",
  "completed": "false",
  "status": "unpaid",
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
  "object": "List",
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
  "object": "Batch",
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

### HTTP Request

`GET http://example.com/batches/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the batch to retrieve

## Cancel a Specific Batch

Canceling a batch is made with a delete request. We delete the contents of the
batch but keep a record of it being canceled.

Refunds will be given for data that have not yet been contracted by workers.

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

### HTTP Request

`DELETE https://openguilds.com/batches/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the batch to cancel

## Pay for a Batch

You can pay for a batch by creating a Payment.
The payment will take your credits and bind them to a contract for a worker.
The worker is given the credit upon the completion criteria of the contract
being met.

```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
api.batches.pay(1)
```

```shell
curl "https://openguilds.com/api/batches/1/payments"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> The above command returns JSON structured like this:

```json
{
  "object": "Payment",
  "id": 2,
  "amount" : "$2.00",
  "source": {
    "object": "Batch",
    "id": "1"
  },
  "receipt": [
    {
      "object": "LineItem", 
      "cost": "$1.00",
      "source": {
          "object": "Datum",
          "id": "1"
      }
    },
    { 
      "object": "LineItem", 
      "cost": "$1.00",
      "source": {
          "object": "Datum",
          "id": "2"
      }
    },
  ]
}
```

