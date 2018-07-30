# Guilds

## The Guild Object
> The Guild object looks like this:

```json
{
  "object": "Guild",
  "id": "1",
  "name": "false",
  "description": "processing",
  "price_floor": "$1.80",
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


