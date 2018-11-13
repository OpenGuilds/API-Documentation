# Workspaces

## Acceptable Workspaces

Workspaces are any web server which follows some specific rules:

1. It must pass through some URL parameters into its form as listed below.
2. It must provide the user a submit button which returns information to the submitTo parameter value.
3. It must use HTTPs protocol.
4. It must be accessible to the Workers.

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
