# Challenge - Container Instance (ACI)

**Estimated Time:** 15 minutes

## Overview

Put everything you have learned together by creating an 
[Azure Container Instance (ACI)](https://azure.microsoft.com/en-us/services/container-instances/) that runs a single container web app. 
The container [`microsoft/aci-helloworld:latest`](https://hub.docker.com/r/microsoft/aci-helloworld/)
is a good candidate to use.

## Exercises

* Create a Terraform file that will create:

  * [Resource Group](https://www.terraform.io/docs/providers/azurerm/r/resource_group.html)
  * [Azure Container Instance](https://www.terraform.io/docs/providers/azurerm/r/container_group.html)

  > NOTE: The container's DNS name must be globally unique, so include your initials 
  > or some other random value to ensure uniqueness (e.g. xyz-container-20200121).

* Use remote storage to store the state file

* Include output variables that contains the containers FQDN

* Browse to the ACI's URL to ensure the container is working

* Destroy the resources when you are done

## Solution

[main.tf file](solution/main.tf)

<details>
<summary>
Execution script
</summary>

```bash

terraform init --backend-config=../../backend-secrets.tfvars --backend-config='key=task5.tfstate'

# Apply the script with the specified variable values
terraform apply \
-var 'resource_group_name=my-containerinstance-20200121' \
-var 'container_name=cdw-myaci-20200121' \
-var 'location=westus2'

```

</details>