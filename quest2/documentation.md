# Configuration de l'environnement de test Ansible

Ce guide vous explique comment configurer un environnement de test avec Ansible de manière simple et efficace.

## Prérequis

Avant de commencer, assurez-vous d'avoir :

- **Python** installé sur votre machine.
- **Ansible** installé.

## Étapes d'installation

1. **Installer Python**  
   Si Python n'est pas encore installé, vous pouvez le télécharger et l'installer depuis le site officiel [python.org](https://www.python.org/).

2. **Installer Ansible**  
   Si vous utilisez Ubuntu, exécutez la commande suivante dans votre terminal :  
   ```bash
   sudo apt-get update && sudo apt-get install ansible
   ```

## Exécuter le Playbook

Pour lancer votre playbook Ansible, utilisez la commande suivante :  
```bash
ansible-playbook -i inventory.ini site.yml
```