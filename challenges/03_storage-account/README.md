# Challenge - Storage Account

**Estimated Time:** 15 minutes

## Overview

Now that we understand the basics of Terraform, we can move on to additional topics. When we
want to create resources for cloud resources, we need a central location to store our state
files. This allows you to execute your Terraform scripts from multiple computers, other users
or, most importantly, a DevOps workflow.

> NOTE: Your state files may contain sensitive information and should be protected with RBAC.

## Lesson

We have a *chicken and the egg* problem where we need a storage account to store our remote state
files to use Terraform in a cloud setting. But, we want to use Terraform to create this storage account.

We can't have everything, so let's start by creating a storage account using Terraform that we can 
use in subsequent challenges, and we won't worry about storing the state remotely for this challenge.

Usually, this should be a one-time operation and we should not need to update or delete this
storage account often (or ever), so this seems like a good trade-off.

* [Remote State](https://www.terraform.io/docs/state/remote.html)
* [String Interpolation](https://www.terraform.io/docs/configuration/expressions.html#interpolation)
* [Output Variables](https://www.terraform.io/docs/configuration/outputs.html)

## Exercises

* Create a Terraform file that will create:

  * Resource Group  
  * Azure [storage account](https://www.terraform.io/docs/providers/azurerm/r/storage_account.html)  
  * [Blob container](https://www.terraform.io/docs/providers/azurerm/r/storage_container.html)  
  
  > NOTE: The storage account name must be globally unique, so include your initials or some other random value
  > to ensure uniqueness (e.g. tfstate20200117xyz). The storage account and blob container names must be
  > alpha-numeric and all lowercase.

* Include output variables that contain:

  * storage_account_name
  * blob_container_name
  * primary_access_key

* Check your execution plan

* Apply the Terraform script

* Copy and save the output variable values for later use

* Find the storage account in the Azure portal

## Solution

[Sample main.tf file](solution/main.tf)

<details>
<summary>
Execution script
</summary>

```bash

# No remote storage here
terraform init

# Apply the script with the specified variable values
terraform apply \
-var 'resource_group_name=cdw-tfstate-20200121' \
-var 'storage_account_name=tfstate20200121xyz' \
-var 'blob_container_name=tfstatefiles' \
-var 'location=westus2'

```
</details>
