# Project paths and variables
TERRAFORM_DIR = terraform
ANSIBLE_DIR = ansible
INVENTORY_FILE = $(ANSIBLE_DIR)/inventory.ini
SSH_KEY = $(ANSIBLE_DIR)/deploy_idrsa

# Targets
.PHONY: all setup terraform ansible clean help

# Default target
all: help

# Help target
help:
	@echo "Usage: make [TARGET]"
	@echo "Targets:"
	@echo "  setup       - Install required dependencies (Terraform, Ansible, etc.)"
	@echo "  terraform   - Initialize, plan, and apply the Terraform configuration"
	@echo "  ansible     - Run Ansible playbooks against provisioned servers"
	@echo "  clean       - Destroy Terraform resources and clean up"
	@echo "  help        - Show this help message"

# Install dependencies
setup:
	@echo "Installing required dependencies..."
	@sudo apt update
	@sudo apt install -y terraform ansible sshpass
	@echo "Setup complete."

# Run Terraform
terraform:
	@echo "Running Terraform..."
	cd $(TERRAFORM_DIR) && terraform init && terraform plan && terraform apply -auto-approve
	@echo "Terraform completed."

# Run Ansible
ansible:
	@echo "Running Ansible..."
	ansible all -i $(INVENTORY_FILE) -m ping --private-key=$(SSH_KEY)
	@echo "Ansible completed."

# Clean up resources
clean:
	@echo "Destroying resources with Terraform..."
	cd $(TERRAFORM_DIR) && terraform destroy -auto-approve
	@echo "Cleaning up temporary files..."
	rm -rf $(TERRAFORM_DIR)/.terraform
	rm -rf $(ANSIBLE_DIR)/.ansible
	@echo "Cleanup complete."
