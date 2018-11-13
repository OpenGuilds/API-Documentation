---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors
  - guilds
  - batches
  - interfaces
  - wallets

search: true
---

# Introduction

Welcome to the OpenGuilds API documentation! Our API is REST based. That means predictable resource-oriented URLs, which return HTTP response codes to indicate API errors.

Responses are given in JSON format, which return both errors and data requested.

# Authentication


> Authorize to using your API Key:

```ruby
require 'open-guilds'

api = OpenGuilds::Client.authorize!('8641fb38-294a-41d9-9591-3449dfd99910')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -u "8641fb38-294a-41d9-9591-3449dfd99910"
```

> Make sure to replace `8641fb38-294a-41d9-9591-3449dfd99910` with your API key.

OpenGuilds uses API keys to allow access to the API. You can register a new OpenGuilds API key at our [developer portal](http://example.com/developers).

Authentication is done using an API secret key in a given request. Manage API keys from your dashboard. API keys allow access to all functions of your account and should be kept secret. Do not put keys on publicly accessable Github repositories or in client-side code.

Authentication is performed via HTTP Basic Auth. Provide your API key as the basic auth username value. You do not need to provide a password.

OpenGuilds expects for the API key to be included in all API requests to the server in a header that looks like the following:

All API requests will be made of HTTPS. Calls over plain HTTP will fail. API requests without authentication will also fail.

<aside class="notice">
You must replace <code>8641fb38-294a-41d9-9591-3449dfd99910</code> with your personal API key.
</aside>
