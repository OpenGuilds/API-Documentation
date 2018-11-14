# Workspaces

## The Workspace Object

> The Workspae object looks like this:

```json
{
  "object": "Workspace",
  "id": "1",
  "name": "Audio Transcription Interface",
  "preview": "https://preview.interface.com",
  "permissions": "open",
  "created": "2015-05-22T14:56:29.000Z",
  "updated": "2015-05-22T14:56:28.000Z"
}
```

Workspaces are any statically hosted website that can take parameters in through
the URL, allow workers to perform transformations on them, and then send their
data back through a form to a given destination.


Attribute | Description
--------- | -----------
object | The object being described by the incoming data, in this case a workspace.
id | The ID of the workspace.
name | The workspace name.
preview | A link to preview the workspace at.
permissions | The permissions level of the interface.

Permissions can be one of two states:

Attribute | Description
--------- | -----------
open | The workspace is open for others to use in their own guilds.
closed | The workspace is private to its creator.

## Acceptable Workspaces

Workspaces are any web server which follows some specific rules:

1. It must pass through some URL parameters into its form as listed below.
2. It must provide the user a submit button which returns information to the submitTo parameter value.
3. It must use HTTPs protocol.
4. It must be accessible to the guild members.

The attributes it must pass are:

Attribute  | Meaning
---------- | -------
workerId | The ID of the worker who is completing the assignment
assignmentId | The ID of the assignment the work is submitted to
submitTo | The URL that the form should be submitted to.

Make sure your form submits to the submitTo value with the assignmentId as a
hidden field.


<aside class="warning">
AJAX requests will not work.
The user must submit the form directly by the user.
</aside>
