.PHONY: all setup run test debug clean

ANSIBLE_DIR = C:/Temp/ansible
SOURCE_DIR = C:/Users/Y.CHEHBOUB/OneDrive - INSEAD/Desktop/TIC-MEP3/quest 2/ansible
DOCKER_IMAGE = alpine/ansible

make:
all: setup run test debug

setup:
	@echo "Setting up environment..."
	@if not exist $(ANSIBLE_DIR) mkdir $(ANSIBLE_DIR)
	@xcopy "$(SOURCE_DIR)" "$(ANSIBLE_DIR)" /s /y > nul
	powershell -Command "icacls '$(ANSIBLE_DIR)/deploy_idrsa' /inheritance:r /grant:r '$(USERNAME):F'"
	@docker run --rm -v "$(ANSIBLE_DIR):/ansible" $(DOCKER_IMAGE) chmod 600 /ansible/deploy_idrsa
	@echo "Environment setup complete."

run:
	@echo "Running ansible ping..."
	@docker run --rm -v "$(ANSIBLE_DIR):/ansible" $(DOCKER_IMAGE) ansible all -i /ansible/inventory.ini --private-key=/ansible/deploy_idrsa -m ping

test:
	@echo "Running tests..."
	@docker run --rm -v "$(ANSIBLE_DIR):/ansible" $(DOCKER_IMAGE) ansible-playbook /ansible/site.yml --syntax-check
	@docker run --rm -v "$(ANSIBLE_DIR):/ansible" $(DOCKER_IMAGE) ansible-playbook /ansible/site.yml

debug:
	@echo "Running debug..."
	@echo "Testing SSH connectivity:"
	@ssh -v -i "$(ANSIBLE_DIR)/deploy_idrsa" admin@13.37.227.196 || echo "Debug SSH connection failed."
	@echo "Testing Ansible ping with verbose output:"
	@docker run --rm -v "$(ANSIBLE_DIR):/ansible" $(DOCKER_IMAGE) ansible all -i /ansible/inventory.ini --private-key=/ansible/deploy_idrsa -m ping -vvvv || echo "Ansible debug failed."

clean:
	@echo "Cleaning up..."
	@if exist $(ANSIBLE_DIR) rmdir /s /q $(ANSIBLE_DIR)
	@echo "Cleanup complete."
