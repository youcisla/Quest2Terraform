
# Documentation - Quest 2

## Introduction
Ce document contient une documentation détaillée pour compléter chaque étape de la Quest 2, en utilisant Ansible et Terraform pour automatiser les tâches DevOps. Il est structuré pour permettre à un utilisateur débutant de reproduire les étapes et de répondre aux questions posées dans les fichiers PDF fournis.

---

## Prérequis
1. Compte AWS actif avec crédits disponibles.
2. Terraform installé sur votre machine.
3. Ansible installé (voir étape 1).
4. Accès aux fichiers de configuration nécessaires (infrastructure, playbooks, etc.).
5. Accès à un environnement Linux ou Windows avec Docker.

---

## Étape 1 : Installation de l’environnement Ansible

### Objectifs
- Comprendre le rôle d'Ansible.
- Installer et configurer Ansible pour un environnement de test.
- Développer un playbook pour tester la communication avec les machines de test.

### Instructions
1. **Installation Ansible** :
    - Sur Ubuntu :
        ```bash
        sudo apt update
        sudo apt install ansible -y
        ```
    - Vérifiez l'installation :
        ```bash
        ansible --version
        ```
2. **Configurer l'inventaire** :
    - Créez un fichier `inventory` :
        ```
        [reverse_proxy]
        192.168.1.54

        [backend_servers]
        192.168.1.50
        192.168.1.51

        [database_servers]
        192.168.1.53
        ```
3. **Créer un Playbook** :
    - Exemple de playbook pour vérifier la connectivité :
        ```yaml
        - name: Test de communication
          hosts: all
          tasks:
            - name: Ping
              ping:
        ```

### Réponses aux Questions
1. Ansible est utilisé pour automatiser la gestion de configuration, le déploiement et les tâches IT.
2. L'inventaire Ansible liste les machines gérées.
3. Un playbook est un fichier YAML qui décrit les tâches à exécuter.
4. Un "play" est une liste d'actions à effectuer sur un groupe d'hôtes.

---

## Étape 2 : Création d’un rôle

### Objectifs
- Créer des rôles Ansible pour MySQL et Crowdin.
- Assurer l’idempotence.

### Instructions
1. **Créer un rôle pour MySQL** :
    - Commande :
        ```bash
        ansible-galaxy init roles/mysql
        ```
    - Ajoutez les configurations nécessaires dans `roles/mysql/tasks/main.yml`.

2. **Créer un rôle pour Crowdin** :
    - Commande :
        ```bash
        ansible-galaxy init roles/crowdin
        ```

3. **Intégrer les rôles dans le playbook principal** :
    ```yaml
    - name: Déploiement complet
      hosts: all
      roles:
        - mysql
        - crowdin
    ```

### Réponses aux Questions
1. Un rôle est une structure qui permet d’organiser le code.
2. L’idempotence garantit que le même résultat sera obtenu peu importe le nombre d’exécutions.
3. Ansible Galaxy est une plateforme de partage de rôles.

---

## Étape 3 : Reverse Proxy et Load Balancing

### Objectifs
- Configurer un reverse proxy avec répartition de charge.

### Instructions
1. Installez Nginx sur le reverse proxy :
    ```bash
    sudo apt update
    sudo apt install nginx -y
    ```
2. Configurez le fichier `/etc/nginx/nginx.conf` pour inclure des règles de load balancing.

### Réponses aux Questions
1. Un reverse proxy agit comme intermédiaire entre le client et les serveurs backend.
2. Le load balancing distribue le trafic entre plusieurs serveurs pour optimiser les performances.

---

## Étape 4 : Sécurité

### Objectifs
- Assurer la sécurité avec HTTPS, Fail2ban et UFW.

### Instructions
1. Installez et configurez UFW :
    ```bash
    sudo apt install ufw -y
    sudo ufw allow ssh
    sudo ufw enable
    ```
2. Configurez HTTPS sur le reverse proxy avec Certbot.
3. Installez Fail2ban :
    ```bash
    sudo apt install fail2ban -y
    ```

### Réponses aux Questions
1. Un firewall contrôle le trafic réseau.
2. Alternatives à UFW : iptables, firewalld.
3. Fail2ban bloque les adresses IP après plusieurs tentatives infructueuses.

---

## Étape 5 : Supervision

### Objectifs
- Implémenter un système de logs et des tests d'intégration.

### Instructions
1. Déployez une machine de supervision avec Terraform.
2. Configurez un outil de logs comme ELK ou Prometheus.
3. Implémentez des tests Ansible pour vérifier les services backend.

### Réponses aux Questions
1. La supervision permet de garantir la disponibilité et les performances.
2. Les tests d'intégration valident que les services fonctionnent correctement.

---

## Conclusion
Ce projet vous a guidé à travers l'installation, la configuration et l'utilisation d'Ansible et Terraform pour une infrastructure complète. Veillez à détruire l'infrastructure AWS une fois le travail terminé pour éviter des frais inutiles.
