#!/bin/bash
set -e

# Load Azure credentials from .env
if [ -f ".env" ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo "❌ Missing .env file with Azure credentials."
  exit 1
fi

# Check if terraform.tfvars exists
if [ ! -f "terraform.tfvars" ]; then
  echo "❌ terraform.tfvars file not found!"
  exit 1
fi

# Initialize Terraform
echo "🚀 Initializing Terraform..."
terraform init

# Validate configuration
echo "🔍 Validating configuration..."
terraform validate

# Run Terraform plan
echo "📝 Running Terraform plan with terraform.tfvars..."
terraform plan -var-file="terraform.tfvars"

# Prompt to apply
echo ""
echo "❓ Do you want to apply the changes? (y/n)"
read -r CONFIRM
if [ "$CONFIRM" = "y" ]; then
  echo "⚙️ Applying Terraform configuration..."
  terraform apply -var-file="terraform.tfvars"

  echo ""
  echo "✅ Deployment complete!"
  echo "🌐 Web App URL:"
  terraform output web_app_url
else
  echo "🚫 Deployment cancelled."
fi
        