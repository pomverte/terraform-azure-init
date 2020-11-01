# Terraform Azure init

![Build](https://github.com/pomverte/terraform-azure-init/workflows/Build/badge.svg)

This repository aims to create the minimum necessary infrastructure on Azure
for Terraform to work with a remote backend.

⚠️ The Storage Account is configured to be prevent from being destroyed by Terraform

## Azure login

```
az login
```

OR use an [Azure Service Principal](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)

```
export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
export ARM_CLIENT_SECRET="00000000-0000-0000-0000-000000000000"
export ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"
export ARM_TENANT_ID="00000000-0000-0000-0000-000000000000"
```

Optional:
```
export ARM_SKIP_PROVIDER_REGISTRATION="true"
````

## Launch Terraform

```
terraform init
terraform plan
terraform apply
```

## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.13 |
| azurerm | ~> 2.34 |
| random | ~> 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azure\_location | Azure location | `string` | `"West Europe"` | no |
| resource\_group\_name | Azure resource group name | `string` | `"rg-terraform-init"` | no |
| storage\_account\_container\_name | Azure storage account container name | `string` | `"terraform"` | no |
| storage\_account\_name | Azure storage account name that will host the remote backend | `string` | `"terraform"` | no |
| tags | Azure resources tags | `map(string)` | <pre>{<br>  "Provider": "Terraform",<br>  "Purpose": "Terraform remote backend"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| location | n/a |
| primary\_access\_key | n/a |
| resource\_group\_name | n/a |
| storage\_account\_container\_name | n/a |
| storage\_account\_name | n/a |

