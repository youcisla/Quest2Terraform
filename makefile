# Project paths and variables
TERRAFORM_DIR = terraform
ANSIBLE_DIR = /ansible
INVENTORY_FILE = $(ANSIBLE_DIR)/inventory.ini
SSH_KEY = $(ANSIBLE_DIR)/deploy_idrsa.pub

# Targets
.PHONY: all setup terraform ansible clean help build-ansible run-ansible ssh-test ansible-playbook connect-proxy

# Default target
all: help

# Help target
help:
	@echo "Usage: make [TARGET]"
	@echo "Targets:"
	@echo "  setup            - Install required dependencies (Terraform, Ansible, etc.)"
	@echo "  terraform        - Initialize, plan, and apply the Terraform configuration"
	@echo "  ansible          - Run Ansible playbooks against provisioned servers"
	@echo "  clean            - Destroy Terraform resources and clean up"
	@echo "  build-ansible    - Build Docker image for Ansible setup"
	@echo "  run-ansible      - Run Ansible tasks via Docker"
	@echo "  ssh-test         - Test SSH connectivity"
	@echo "  ansible-playbook - Run Ansible playbook"

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

# Build the Docker image
build-ansible:
	docker build -t ansible-setup .

# Run the Ansible container
run-ansible:
	docker run -it -v $(ANSIBLE_DIR):$(ANSIBLE_DIR) ansible-setup ansible all -i $(INVENTORY_FILE) -m ping --private-key=$(SSH_KEY) -e "ansible_ssh_common_args='-o StrictHostKeyChecking=no'"

ssh-test:
	docker run -it -v "C:/Users/Y.CHEHBOUB/OneDrive-INSEAD/Desktop/TIC-MEP3/latest/Quest2Terraform/ansible:/ansible" ansible-setup bash -c "ssh -i /ansible/deploy_idrsa.pub admin@51.44.10.97"

# Run Ansible playbook
ansible-playbook:
	docker run -it -v $(ANSIBLE_DIR):$(ANSIBLE_DIR) ansible-setup ansible-playbook $(ANSIBLE_DIR)/site.yml -i $(INVENTORY_FILE)

connect-proxy:
	ssh -i Youcef_key.pem admin@51.44.10.97