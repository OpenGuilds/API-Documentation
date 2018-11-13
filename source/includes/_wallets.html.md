# Wallet

## The Wallet Object
> The Wallet object looks like this:

```json
{
  "object": "Wallet",
  "id": "2",
  "transactions": [...],
  "balance": "$20.00",
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

Wallets are created when a user account is created.

Wallets store a history of Transactions, which can be Credit, or Debit types.

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
  "type": "Credit",
  "amount": "$5.00",
  "source": {...},
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
type | The type of the transaction, can be either Credit or Debit.
amount | The amount either credited or debited from the account.
source | Details of the object which was purchased or paid for.


## Show your Wallet
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
api.wallet.get
```

```shell
curl "https://openguilds.com/api/wallet"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> Which should return your Wallet:

```json
{
  "object": "Wallet",
  "id": "2",
  "transactions": [...],
  "balance": "$20.00",
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

### HTTP Request

`GET http://openguilds.com/api/wallet/`
