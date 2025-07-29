This project uses **Terraform** to provision an **Azure Resource Group**, **App Service Plan**, and a **Windows Web App** on Microsoft Azure. It automates deployment using a Bash script (`deploy.sh`) and reads configurations from a single `terraform.tfvars` file.

---

## Features

- Automates Azure Web App deployment
- Uses a `.env` file to securely load Azure credentials
- Reads input variables from `terraform.tfvars`
- Outputs the deployed Web App URL to the terminal

---

## Project Structure

```
.
├── main.tf              # Main infrastructure definition
├── variables.tf         # Input variable declarations
├── terraform.tfvars     # Actual values for variables
├── outputs.tf           # Displays Web App URL after deployment
├── deploy.sh            # Bash script to automate deployment
├── .env
|-- .gitignore              # Azure credentials (not committed)
└── README.md            # Project documentation
```

---

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) ≥ 1.0
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- An Azure subscription
- A Service Principal with `Contributor` role

---

## Set Up Azure Credentials

1. **Create a Service Principal:**

```bash
az ad sp create-for-rbac --name terraform-sp --role Contributor   --scopes /subscriptions/<your-subscription-id> --sdk-auth
```

2. **Create a `.env` file in the project root:**

```dotenv
# .env - do NOT commit this file!
ARM_CLIENT_ID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
ARM_CLIENT_SECRET=your-super-secret
ARM_SUBSCRIPTION_ID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
ARM_TENANT_ID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

> **Important:** Add `.env` to your `.gitignore` to avoid committing secrets.

---

## Configure Inputs

Edit the `terraform.tfvars` file with your own values:

```hcl
resource_group_name = "example-resource-group"
location            = "West Europe"
app_service_plan    = "example-service-plan"
web_app_name        = "your-unique-webapp-name"
```

---

## Run the Deployment

```bash
chmod +x deploy.sh
./deploy.sh
```

You will be prompted to confirm before applying the changes.

---

## Output

After a successful deployment, the script will print the Web App URL:

```
Deployment complete!
Web App URL:
https://your-unique-webapp-name.azurewebsites.net
```

---

## Clean Up

To destroy the deployed infrastructure:

```bash
terraform destroy -var-file="terraform.tfvars"
```

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Contributing

Contributions, issues, and feature requests are welcome! Feel free to open a pull request or issue.
