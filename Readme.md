# Learn Terraform by doing
Welcome to the Terraform Repository! This repository is designed to help you learn and master Terraform, an open-source infrastructure as code software tool.

## Prerequisites

Before you start, ensure you have the following:

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine
- Basic knowledge of cloud providers (e.g., AWS, Azure, GCP)
- A code editor (e.g., Visual Studio Code, Atom)

## Terraform Basic commands

Terraform workflow

To initialize and download provider plugins 

```terraform init```

To get blueprint of configuration

```terraform plan```

To apply changes 

```terraform apply```

To rename a resource in statefile
For instance, I am assuming aws_vpc

```terraform state mv aws_vpc.oldname aws_vpc.newname``` once you run this command, make appropriate changes in configuration files.

Use ```terraform fmt``` for formatting the code and ```terraform validate``` to validate the code