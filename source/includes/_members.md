# Members

## The Member Object
> The Member object looks like this:

```json
{
  "object": "Member",
  "id": "1",
  "email": "email@example.com",
  "quality_score": "0.86",
  "credit": "$5.00",
  "credit_cents": 500,
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

Members are individuals in a Guilds community.
Members can get qualifications, subscribe to tasks and perform work for a Guild.

Members are rewarded for their correct work with guild credits.
Members can request a payout from a guild which is then authorized by the guild owner.

Members are assigned a quality score which is measured by their answers given to
specific questions according to a golden set of answers.

The object has the following attributes:

Attribute | Description
--------- | -----------
object | The object being described by the incoming data, in this case a Guild.
id | The ID of the batch being returned.
email | The email of the Member.
quality_score | A score between 0.00 and 1.00 which determines the members test accuracy.
credit | The total available credit a user has to request a payout with expressed in humanized money form with currency symbol.
credit_cents | The total available credit a user has to request a payout expressed in the number of cents.

## Get all Members
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
guild = api.guilds.get(1)
guild.members
```

```shell
curl "https://openguilds.com/api/guilds/<GUILD_ID>/members
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> The above command returns JSON structured like this:

```json
{
  "object": "List",
  "url": "/api/guilds/1/members",
  "has_more": "false",
  "data": [
    {
      "object": "Member",
      "id": "1",
      "email": "email@example.com",
      "quality_score": "0.86",
      "credit": "$5.00",
      "credit_cents": 500,
      "created": "2015-05-22T14:56:29.000Z",
      "updated": "2015-05-22T14:56:28.000Z"
    }
  ]
}

```

### HTTP Request

`GET http://openguilds.com/api/guild/<GUILD_ID>/members`

### URL Parameters

Parameter | Description
--------- | -----------
GUILD_ID | The ID of the guild you want to view the membership of


## Get a Member
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
guild = api.guilds.get(1)
guild.members.find('email@example.com')
```

```shell
curl "https://openguilds.com/api/guilds/<GUILD_ID>/members/find"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
  -d email='email@example.com'
```

> The above command returns JSON structured like this:

```json
{
  "object": "Member",
  "id": "1",
  "email": "email@example.com",
  "quality_score": "0.86",
  "credit": "$5.00",
  "credit_cents": 500,
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}

```

### HTTP Request

`GET http://openguilds.com/api/guild/<GUILD_ID>/members/find`

### URL Parameters

Parameter | Description
--------- | -----------
GUILD_ID | The ID of the guild the membership is for
email | The email of the member you wish to find



## Invite a new Member
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
guild = api.guilds.get(1)
guild.members.invite('email@example.com')
```

```shell
curl "https://openguilds.com/api/guilds/<GUILD_ID>/invites"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
  -d email="email@example.com"
```

> The above command returns JSON structured like this:

```json
{
  "object": "Invite",
  "id": "1",
  "email": "email@example.com",
  "status": "sending",
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}

```

### HTTP Request

`GET http://openguilds.com/api/guild/<GUILD_ID>/invites`

### URL Parameters

Parameter | Description
--------- | -----------
GUILD_ID | The ID of the guild the invite is for


## Remove a Member
```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
guild = api.guilds.get(1)
member = guild.members.find('email@example.com')
member.remove
```

```shell
curl "https://openguilds.com/api/guilds/<GUILD_ID>/members/<ID>"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
  -X DELETE
```

> The above command returns JSON structured like this:

```json
{
  "object": "Member",
  "id": "1",
  "deleted": "true",
}

```

### HTTP Request

`GET http://openguilds.com/api/guild/<GUILD_ID>/members<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
GUILD_ID | The ID of the guild the invite is for
ID | The ID of the member you want to remove
