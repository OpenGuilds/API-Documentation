# Chains

## The Chain Object

> Assuming you had the following chain of Data, as represented by their ID's:

> 1 -> 2 -> 3

> The Chain would then look like:

```json
{
  "object": "Chain",
  "url": "/api/data/<ID>/chain",
  "has_more": false,
  "root_datum_id": "1",
  "depth": "3",
  "data": {
    "1": {
      "2": {
        "3": {}
      }
    }
  },
  "status": "Processing",
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

Chains can be accessed from any Datum. That Datum will act as the root node for
the chain.

The object has the following attributes:

Attribute | Description
--------- | -----------
object | The object being described by the incoming data, in this case a Chain.
url | The URL of for the resource if you need to request for more.
has_more | Returns true if the hash was limited and there is more past the deepest node.
root_datum_id | The ID of the datum being used as the tree root.
depth | A number representing the tree depth of the newest generation.
completed | Returns true if the batch data is all completed, otherwise false.
status | A status describing the current state of the batch.

The status of a batch object can be one of the following:

Status | Description
--------- | -----------
Processing | Not all data in the chain has been completed.
Completed | All data in the chain has been processed and marked as complete.


## Get a Chain
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
datum = api.data.get(<ID>)
datum.chain
```

```shell
curl "https://openguilds.com/api/data/<ID>/chain"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> The above command returns JSON structured like this:

```json
{
  "object": "Chain",
  "url": "/api/data/<ID>/chain",
  "has_more": false,
  "root_datum_id": "1",
  "depth": "3",
  "data": {...},
  "status": "Processing",
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

A Chain contains ordered, nested information about how a piece of data has
evolved over time.

### HTTP Request

`GET http://openguilds.com/api/data/<ID>/chain`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the datum to retrieve
