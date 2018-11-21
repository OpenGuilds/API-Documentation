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

Each [guild](#the-guild-object) you join has its own individual Wallet.

Wallets store a history of [transactions](#the-transaction-object), 
which can be different types.

Wallet credits can be exchanged by workers by requesting a payout.

A Wallet has the following attributes:

Attribute | Type | Description
--------- | ---- | -----------
object | string | A string representing the object type.
id | string | The ID of the Wallet being returned.
transactions | array[transactions] | A time ordered history of Transactions, with the newest first.
balance | string | The total amount of Credits from adding all Credits minus Debits.
balance_cents | integer | The balance represented in cents.

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

Transactions are created when paying for something, or exchanging credits.

A Transaction has the following attributes:

Attribute | Type | Description
--------- | ---- | -----------
object | string | A string representing the object type.
id | string | The ID of the Wallet being returned.
type | string | The type of the transaction, can be one of the valid transaction types.
amount | string | The amount either credited or debited during the transaction.
amount_cents | integer | The amount credited or debited during the transaction in cents.

A transaction can have the following types:

Type | Description
---- | -----------
Guild Credit | A positive transfer of guild currency.
Guild Debit | A negative transfer of guild currency.
Amazon Credit | A positive transfer of Amazon credits.
Amazon Debit | A negative transfer of Amazon credits.
Fiat Credit | A positive transfer of fiat money.
Fiat Debit | A negative transfer of fiat money.



## List all Wallets

Will return all wallets belonging to the user.

```ruby
require 'open-guilds'
OpenGuilds.api_key = '8641fb38-294a-41d9-9591-3449dfd99910'

OpenGuilds::Wallet.list()
```

```shell
curl "https://openguilds.com/api/wallets"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> The above command returns JSON structured like this:

```json
{
  "object": "List",
  "url": "/api/wallets",
  "has_more": "false",
  "page": 1,
  "data": [
    {
      "object": "Wallet",
      "id": "2",
      "transactions": [
        {
          "object": "Transaction",
          "id": "1",
          "type": "Guild Credit",
          "amount": "$5.00",
          "amount_cents": 500,
          "created": "2015-05-22T14:56:29.000Z",
          "updated": "2015-05-22T14:56:28.000Z"
        }
      ],
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

Will return a wallet object belonging to the authenticated user.

```ruby
require 'open-guilds'
OpenGuilds.api_key = '8641fb38-294a-41d9-9591-3449dfd99910'

OpenGuilds::Wallet.get(1)
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
  "transactions": [
    {
      "object": "Transaction",
      "id": "1",
      "type": "Guild Credit",
      "amount": "$5.00",
      "amount_cents": 500,
      "created": "2015-05-22T14:56:29.000Z",
      "updated": "2015-05-22T14:56:28.000Z"
    }
  ],
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
