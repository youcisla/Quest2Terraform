# Questions et Réponses :

### À quoi sert Ansible ?

Ansible est un outil open source conçu pour :
- La **gestion de configuration** : automatiser et maintenir les paramètres des serveurs.
- Le **déploiement d'applications** : simplifier l'installation et la mise à jour de logiciels.
- L'**automatisation de l'infrastructure** : gérer des réseaux, des bases de données, et bien plus.

### À quoi sert l'inventaire Ansible ?

L'inventaire Ansible est un fichier (ou un ensemble de fichiers) où sont définis et organisés les hôtes qu'Ansible doit gérer. Il permet de :
- Spécifier les serveurs ou périphériques à cibler.
- Définir les informations de connexion (IP, ports, clés SSH, etc.).
- Grouper les hôtes pour appliquer des tâches de manière collective.

### À quoi sert un playbook ?

Un playbook est un fichier écrit en YAML qui décrit les tâches qu'Ansible doit effectuer sur les hôtes distants. Il est utilisé pour :
- Orchestrer des processus complexes : comme la mise à jour de systèmes ou le déploiement de clusters.
- Gérer les configurations : appliquer des réglages spécifiques à un environnement.
- Déployer des applications : automatiser les installations avec précision.

### Qu’est-ce qu’un play ?

Un play est une unité de travail spécifique dans un playbook. Il sert à :
- Définir **les tâches** à réaliser.
- Préciser **les groupes d'hôtes** sur lesquels les tâches seront appliquées.
- Structurer les opérations pour exécuter des processus complexes, étape par étape, sur plusieurs machines ou groupes.

Chaque play donne à Ansible des instructions claires pour effectuer des actions ciblées et coordonnées.