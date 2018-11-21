# Authentication


> Authorize a client using your API Key:

```ruby
require 'open-guilds'
OpenGuilds.api_key = '8641fb38-294a-41d9-9591-3449dfd99910'
```

```shell
# With shell, you can just pass the correct header with each request
curl "https://dashboard.openguilds.com/api/users/authenticate"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"

# If you need to authenticate via bearer auth 
# (e.g., for a cross-origin request), use:

-H "Authorization: Bearer 8641fb38-294a-41d9-9591-3449dfd99910"
# instead of -u 8641fb38-294a-41d9-9591-3449dfd99910.

```

> Make sure to replace `8641fb38-294a-41d9-9591-3449dfd99910` with your API key.

OpenGuilds uses API keys to allow access to the API. 
You can register a new OpenGuilds API key at our 
[developer portal](https://dashboard.openguilds.com/account).

Authentication is done using an API secret key to be provided in each request. 
Manage API keys from your dashboard. API keys allow access to all functions of 
your account and should be kept secret. Do not put keys on publicly accessible 
Github repositories or in client-side code.

Authentication is performed via HTTP Basic Auth. 
Provide your API key as the basic auth username value. 
You do not need to provide a password.

All API requests will be made over HTTPS. Calls over plain HTTP will fail. 
API requests without authentication will also fail.

OpenGuilds expects for the API key to be included in all API requests to 
the server in a header that looks like the following:


<aside class="notice">
You must replace <code>8641fb38-294a-41d9-9591-3449dfd99910</code> with your personal API key.
</aside>
