# Batches
## The Batch Object

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

Batches are created when you send data to a guild.

They hold information about groupings of data, which are used to prioritize
which pieces of data get completed by a guild at any given time.

When you create a Batch, it is unpaid. Guilds will not work
on Contracts which are unpaid to a price floor they set.

The object has the following attributes:

Attribute | Description
--------- | -----------
object | The object being described by the incoming data, in this case a Batch.
id | The ID of the batch being returned.
fraction_completed | The number of data completed out of the total number in the batch.
completed | Returns true if the batch data is all completed, otherwise false.
status | A status describing the current state of the batch.


The status of a batch object can be one of the following:

Status | Description
--------- | -----------
Processing | Not all data in the batch has been completed.
Completed | All data in the batch has been processed and marked as complete.

## Create a Batch
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
api.batches.create!(
  data: File.open('path/to/data.json')
)
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

A Batch must be created for a specific Guild.

Once created the Batch is set to unpaid.

You can pay for a Batch by creating a payment for it.

When a Batch has been paid for it is sent to the Guild's queue to be processed.


### HTTP Request

`POST http://openguilds.com/api/batches`

### URL Parameters

Parameter | Description
--------- | -----------
data | An array of json, which for each object is converted into a Datum's payload

## Get All Batches
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
  "id": "1",
  "canceled": true
}
```

Canceling a batch is made with a delete request. We delete the contents of the
batch but keep a record of it being canceled.

Refunds will be given for data that have not yet been contracted by workers.

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
  "type": "Debit",
  "amount" : "$2.00",
  "source": {
    "object": "Batch",
    "id": "1"
  }
}
```

You can pay for a batch by creating a Debit Transaction.
The payment will take your Credits and bind them to a contract for a Worker.
The Worker is given the Credit upon the completion criteria of the Contract
being met.

### HTTP Request

`POST http://openguilds.com/api/batches/<ID>/debits`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the Batch to retrieve
