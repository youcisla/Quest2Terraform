# Questions et Réponses :

### Qu’est-ce qu’un firewall ?

Un firewall (pare-feu) est un élément clé de la sécurité réseau. Il :
- **Surveille et filtre** le trafic réseau entrant et sortant.
- Applique des **règles prédéfinies** pour autoriser ou bloquer certaines communications.
- Sert de **barrière** entre un réseau interne fiable et un réseau externe potentiellement dangereux, comme Internet.

Le pare-feu est essentiel pour protéger les ressources internes contre les cybermenaces.

---

### Quelles sont les alternatives à UFW ?

UFW (Uncomplicated Firewall) est une solution populaire pour configurer un pare-feu, mais d'autres outils peuvent être utilisés :

- **iptables** : Une solution avancée pour la gestion des règles de pare-feu sous Linux.
- **nftables** : Une alternative moderne et performante à iptables.
- **Shorewall** : Un gestionnaire basé sur iptables, simplifiant la création de règles complexes.

---

### À quoi sert Fail2ban ?

Fail2ban est un outil de protection contre les intrusions, spécialement utile pour prévenir les attaques par force brute. Il fonctionne en :
- **Surveillant les fichiers journaux** des serveurs.
- Détectant les tentatives répétées de connexion infructueuses.
- **Bloquant automatiquement** les adresses IP suspectes pour une durée déterminée.  

C’est une solution efficace pour sécuriser les serveurs sans intervention manuelle constante.