# Wallet

## The Wallet Object

> The Wallet object looks like this:

```json
{
  "object": "Wallet",
  "id": "2",
  "transactions": [...],
  "balance": "$20.00",
  "balance_cents": 2000,
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

Each [Guild](#the-guild-object) you join has its own individual Wallet.

Wallets store a history of [Transactions](#the-transaction-object), which can be different types.

Wallet credits can be exchanged by workers by requesting a payout.

A Wallet has the following attributes:

Attribute | Description
--------- | -----------
object | The object being described by the incoming data, in this case a Wallet.
id | The ID of the Wallet being returned.
transactions | A time ordered history of Transactions, with the newest first.
balance | The total amount of Credits from adding all Credits minus Debits.

## The Transaction Object
> The Transaction object looks like this:

```json
{
  "object": "Transaction",
  "id": "1",
  "type": "Guild Credit",
  "amount": "$5.00",
  "amount_cents": 500,
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

Transactions are created when paying for something, or purchasing Credits.

A Transaction has the following attributes:

Attribute | Description
--------- | -----------
object | The object being described by the incoming data, in this case a Wallet.
id | The ID of the Wallet being returned.
type | The type of the transaction, can be one of Guild Credit, Guild Debit, Amazon Credit, Amazon Debit, Fiat Credit, or Fiat debit.
amount | The amount either credited or debited during the transaction.
amount_cents | The amount credited or debited during the transaction in cents.



## Get all Wallets
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
wallets = api.wallets

```

```shell
curl "https://openguilds.com/api/wallets
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> The above command returns JSON structured like this:

```json
{
  "object": "List",
  "url": "/api/wallets"
  "has_more": "false",
  "data": [
    {
      "object": "Wallet",
      "id": "2",
      "transactions": [...],
      "balance": "$20.00",
      "balance_cents": 2000,
      "created": "2015-05-22T14:56:29.000Z",
      "updated": "2015-05-22T14:56:28.000Z"
    }
  ]
}

```

### HTTP Request

`GET http://openguilds.com/api/wallets`


## Get a Wallet
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
api.wallet.get(1)
```

```shell
curl "https://openguilds.com/api/wallet/<ID>"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> Which should return your Wallet:

```json
{
  "object": "Wallet",
  "id": "2",
  "transactions": [...],
  "balance": "$20.00",
  "balance_cents": 2000,
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

### HTTP Request

`GET http://openguilds.com/api/wallet/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the Wallet to retrieve
