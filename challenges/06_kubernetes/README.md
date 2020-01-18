# Challenge - Kubernetes

**Estimated Time:** 30 minutes

## Overview

Finish up the workshop by creating an [Azure Kubernetes Cluster (AKS)](https://azure.microsoft.com/en-us/services/kubernetes-service/).  
In this case, all of the Terraform files have been created for you - you just need to apply them.

## Lesson

You will encounter these topics in this challenge.

* [Dependencies](https://www.terraform.io/docs/configuration/resources.html#resource-dependencies)
* [Local Variables](https://www.terraform.io/docs/configuration/locals.html)
* [Modules](https://www.terraform.io/docs/configuration/modules.html)

## Exercises

* Update the variables in the [terraform.tfvars](solution/terraform.tfvars) file

* Understand the [Azure Kubernetes provider](https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html)

* Update the node count so your cluster creates 3 nodes

* Understand how the [service-principal module](solution/service-principal/main.tf) is being referenced and used

* Apply the Terraform files

* Use `kubectl` to confirm the cluster is created

  ```bash
  
  # Use the Azure CLI to get the credentials for the cluster
  az aks get-credentials -g YOUR_RESOURCE_GROUP_NAME -n YOUR_CLUSTER_NAME

  # Confirm that the node count is as expected
  kubectl get nodes

  # View all of the pods
  kubectl get pods -A

  ````

* Destroy the resources when you are done

## Solution

[main.tf file](solution/main.tf)
[terraform.tfvars file](solution/terraform.tfvars)

<details>
<summary>
Execution script
</summary>

```bash

terraform init --backend-config=../../backend-secrets.tfvars --backend-config='key=task6.tfstate'

# Apply the script with the specified variable values
terraform apply

```

</details>