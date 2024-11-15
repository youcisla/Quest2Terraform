# Configuration de l'environnement de test Ansible

Cette documentation décrit les étapes à suivre pour configurer l'environnement de test à l'aide d'Ansible.

## Prérequis

- Python installé sur la machine
- Ansible installé sur la machine

## Étapes d'installation

1. Installez Python (s'il n'est pas déjà installé)
2. Installez Ansible
- Sur Ubuntu : `sudo apt-get update && sudo apt-get install ansible`

## Execute le Playbook

`ansible-playbook -i inventroy.ini site.yml`