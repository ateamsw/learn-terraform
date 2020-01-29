# Challenge - Azure DevOps Pipeline

**Estimated Time:** 60 minutes

## Overview

Now that you have some working scripts, create an [Azure DevOps Pipeline](https://azure.microsoft.com/en-us/services/devops/pipelines/)
that will execute your Terraform file(s) in an automated fashion.

## Lesson

Modern pipelines are defined in YAML files. Here are some resources to get you started.

* [YAML Pipeline Schema](https://docs.microsoft.com/en-us/azure/devops/pipelines/yaml-schema?view=azure-devops&tabs=schema)
* [Terraform and Service Principals](https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html#configuring-the-service-principal-in-terraform)
* [Azure CLI Task in Azure DevOps](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/deploy/azure-cli?view=azure-devops)

## Exercises

* Create a YAML-based Pipeline file for Azure DevOps

* Use the Azure CLI task to execute the Terraform steps

## Solution

[azure-pipelines.yml](solution/azure-pipelines.yml)