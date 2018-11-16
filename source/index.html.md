---
title: OpenGuilds API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby

toc_footers:
  - <a href='https://dashboard.openguilds.com'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - authentication
  - errors
  - pagination
  - guilds
  - members
  - tasks
  - workspaces
  - batches
  - wallets

search: true
---

# Introduction

Welcome to the OpenGuilds API documentation! Our API is REST based. 
That means predictable resource-oriented URLs, which return HTTP response codes 
to indicate API errors.

OpenGuilds API returns responses, including errors, and accepts requests in JSON format only.
Our supported API libraries convert responses to appropriate language-specific objects.

Requests can be made to the live or test server endpoints. 
Test servers are separate from your main account and will not incur costs, including on third
party services such as Amazon Mechanical Turk (it will use the workersandbox).

> Test Endpoint: https://testing.openguilds.com/api

> Live Endpoint: https://dashboard.openguilds.com/api


