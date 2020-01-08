# Ansible in Azure

Ansible includes a suite of Ansible modules that
can be executed directly on remote hosts or via
playbooks. Users can also create their own modules.
Modules can be used to control system resources
such as services, packages, or files - or
execute system commands.

Ansible interacts with the Azure resource manager’s
REST APIs to manage infrastructure components using
Python SDK provided by Microsoft Azure, which
requires credentials of an authorized user to
interact with Azure REST APIs.

For authentication with Azure you can use a
profile stored in ~/.azure/credentials with the
following details:

``` bash
[default]
subscription_id=####################
client_id=##########################
secret=#############################
tenant=#############################
```

How to get these details is described
[Here](https://aster.cloud/2019/07/30/how-to-retrieve-subscription-id-resource-group-id-tenant-id-client-id-and-client-secret-in-azure/)
