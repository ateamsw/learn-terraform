# Challenge - Remote State

**Estimated Time:** 10 minutes

## Overview

Let's recreate our same resource group from [challenge 2](../02_create-resource-group/solution/main.tf),
but this time we will store our remote state in the storage account we create in 
[challenge 3](../03_storage-account/README.md).

> NOTE: Your state files may contain sensitive information and should be protected with RBAC.

## Lesson

Combine your storage account and backend configuration files to setup your remote state files.

* [Remote State](https://www.terraform.io/docs/state/remote.html)
* [Backend Configuration](https://www.terraform.io/docs/backends/config.html)

## Exercises

### Task 1 - Terraform Files

Make these adjustments to your .tf files.

* Add a backend value to your Terraform provider section

  ```terraform

  terraform {
    required_version = ">= 0.12"
    
    backend "azurerm" {
        environment = "public"
    }
  }

  ```

* Create a backend-secrets.tfvars file

  > NOTE: These values should come from the output variables you setup in Challenge 3

  ```terraform

  storage_account_name = "tfstate20200117xyz"
  container_name       = "tfstatefiles"
  key                  = "task4.tfstate"
  access_key           = "YOUR_STORAGE_KEY_GOES_HERE"

  ```

### Task 2 - Terraform Init

Use the `init` command to initialize the folder using the config file.

```bash

terraform init --backend-config backend-secrets.tfvars

```

### Task 3 - Terraform Apply

Rerun the Terraform `init` and `plan` commands to create the resource group.

```bash

terraform apply -var 'resource_group_name=my-resource-group'

```

### Task 4 - Confirm State File

Use the Azure portal to confirm that there is now a file called task4.tfstate in the blob storage container.

## Solution

[main.tf file](solution/main.tf)  
[backend-secrets.tfvars file](solution/backend-secrets.tfvars)  

<details>
<summary>
Execution script
</summary>

```bash

# Use remote storage
terraform init --backend-config backend-secrets.tfvars

# Apply the script
terraform apply -var 'resource_group_name=my-resource-group'

```
</details>
