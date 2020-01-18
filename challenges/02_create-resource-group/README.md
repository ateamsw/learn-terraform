# Challenge - Create Resource Group

**Estimated Time:** 45 minutes

## Lesson

These are some of the fundamentals of Terraform that we need to understand.

* [Formatting](https://www.terraform.io/docs/configuration/syntax.html)
* [Structure](https://www.terraform.io/docs/configuration/override.html)
* [Providers](https://www.terraform.io/docs/providers/azurerm/index.html)
* [Variables](https://www.terraform.io/docs/configuration/variables.html)
* [State Files](https://www.terraform.io/docs/state/index.html)

Terraform Commands
  * [`fmt`](https://www.terraform.io/docs/commands/fmt.html)
  * [`validate`](https://www.terraform.io/docs/commands/validate.html)
  * [`init`](https://www.terraform.io/docs/commands/init.html)
  * [`plan`](https://www.terraform.io/docs/commands/plan.html)
  * [`apply`](https://www.terraform.io/docs/commands/apply.html)
  * [`destroy`](https://www.terraform.io/docs/commands/destroy.html)

## Exercises

Create a resource group in your Azure subscription. Use variables for the resource group's name
and location.

### Task 1 - Terraform Init

Use the `init` command to initialize the folder.

```bash

terraform init

```

### Task 2 - Variable Options

Learn about the different ways to use and set variable values for your script.

* Know how to setup the script to use default values for the variables.

   ```hcl

   variable "resource_group_name" {
     type        = string
     description = "The name of the resource group that will be created."
     default     = "my-resource-group"
   }

   ```

* Know how to provide variable prompts at runtime

   ```hcl

   # No default value specified
   variable "resource_group_name" {
     type        = string
     description = "The name of the resource group that will be created."
   }

   ```

   ```bash

   # No values supplied => will prompt for values
   terraform apply -var 'resource_group_name=my-resource-group'

   ```

* Know how to pass in variable values via the command line 

   ```bash

   terraform apply -var 'resource_group_name=my-resource-group'

   ```

### Task 3 - Terraform Plan

* View the plan

  ```bash

  # Do a dry-run and view output
  terraform plan

  ```

* Save the plan

  ```bash

  # Do a dry-run and create the out file
  terraform plan -out out.tfplan

  ```

### Task 4 - Terraform Apply

* Apply the out.tfplan file

  ```bash

  # Do a dry-run and view output
  terraform apply out.tfplan

  ```

* Apply without a plan

  ```bash

  # Do a dry-run and view output
  terraform apply

  ```

* Apply without a confirmation prompt

  ```bash

  # Will not prompt for approval
  terraform apply -auto-approve

  ```

### Task 5 - Terraform Destroy

* Destroy the resources using the out.tfplan file

  ```bash

  # Do a dry-run and view output
  terraform destroy out.tfplan

  ```

## Solution

[Sample file](solution/main.tf)
