# Data

## The Datum Object
> The Datum object looks like this:

```json
{
  "object": "Datum",
  "id": "2",
  "chain": {...},
  "depth": 1,
  "status": "processing",
  "contracts_count": 1,
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

Data is what gets processed through Guilds in Batches.

A Datum is a single piece of Data.
A Datum has a parent-child relationship with other data to form a Chain.

Chains describe the evolution of a data as it is passed from Worker to Worker,
or split/combined with other Data.

Data are marked completed when the entire Chain that Data is a part of has
been completed.

Chains can be audited and modified until the proper solution has evolved from the
Data with the help of Workers.

A Datum has the following attributes:

Attribute | Description
--------- | -----------
object | The object being described by the incoming data, in this case a Datum.
id | The ID of the Datum being returned.
payload | The URL parameter payload to be put in to the interface.
chain | An ordered, nested hash of evolved Data, may be empty.
depth | The generation of the evolved Data.
contracts_count | the total number of Contracts connected to this Datum.
status | The current status of a given Datum.

The status of a Datum object can be one of the following:

Status | Description
--------- | -----------
Processing | The Chain this Datum is a part of has not yet been completed.
Completed | The Chain this Datum is a part of has been completed.

## Add a Datum to a Batch
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
datum_payload = { image_url: "www.images.com/image/1.png" }.to_json
api.batches(1).add(datum_payload)
```

```shell
curl "https://openguilds.com/api/batch/<batch_id>/data"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
  -H "Content-Type: application/json" 
  -d "@data.json"
```

> Your data.json file should look like:

```json
{ "image_url": "www.images.com/image1.png" }
```

> Which should return your Datum:

```json
{
  "object": "Datum",
  "id": "2",
  "chain": {...},
  "depth": 1,
  "status": "processing",
  "contracts_count": 1,
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```
Data can be created directly and added to a Batch by giving it a Batch ID.

### HTTP Request

`POST http://openguilds.com/api/batches/<batch_id>/data`

## Get a Datum
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
api.data.get(1)
```

```shell
curl "https://openguilds.com/api/data/<ID>"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> The above command returns JSON structured like this:

```json
{
  "object": "Datum",
  "id": "2",
  "chain": {...},
  "depth": 1,
  "status": "processing",
  "contracts_count": 1,
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

### HTTP Request

`GET http://openguilds.com/api/data/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the batch to retrieve

## Delete a Datum
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
api.data.delete(1)
```

```shell
curl "https://openguilds.com/api/data/<ID>"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
  -X DELETE
```

> The above command returns JSON structured like this:

```json
{
  "object": "Datum",
  "id": "2",
  "deleted": true,
}
```

Deletes the Datum and all children in the Chain.

### HTTP Request

`GET http://openguilds.com/api/data/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the batch to delete.
