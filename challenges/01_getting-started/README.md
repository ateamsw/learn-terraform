## Challenge - Getting Started

**Estimated Time:** 15 minutes

Use the Azure Cloud Shell to get connected to your Azure environment and confirm that Terraform is installed.

## Lesson

* Azure Portal

* Azure Cloud Shell

* [Included Tools](https://docs.microsoft.com/en-us/azure/cloud-shell/features#tools)

## Exercises

Make sure you can:

* Log into the [Azure Portal](https://portal.azure.com)

* Launch the Cloud Shell using Bash

  > NOTE: You can also launch the Cloud Shell in [full screen mode](https://shell.azure.com)

* Verify Terraform is installed

  ```bash

  # Confirm Terraform command works
  terraform --version

  ```

* Clone this repository to the Cloud Shell

  ```bash

  # Make a directory for source code
  mkdir -p projects

  # Go to the new directory
  cd projects

  # Clone this repo
  git clone https://github.com/ateamsw/learn-terraform.git

  # Go the the new project
  cd learn-terraform

  ```

* Check out the code editor in Cloud Shell

  ```bash

  # Launch the editor with the current folder
  code .

  ```
