## Entrer dans le container

### Cassandra
```bash
docker exec -it cassandra cqlsh
```

## Utilisation de la base de données Cassandra NoSQL

### Modèle de Données
   Fichier data.cql :

![modèle de données.png](Images/mod%C3%A8le%20de%20donn%C3%A9es.png)

#### Keyspace
Le *keyspace* statistiques est configuré avec une stratégie de réplication simple pour une répartition équilibrée des données dans un environnement de développement.

```sql
CREATE KEYSPACE IF NOT EXISTS statistiques 
WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
```

#### Table des Statistiques des Joueurs

La table cassandra_statistiques dans le keyspace statistiques enregistre chaque événement en jeu d’un joueur, incluant ses actions et gains d’expérience. La conception est optimisée pour des lectures rapides via le partitionnement sur player_id.

```sql
CREATE TABLE IF NOT EXISTS statistiques.cassandra_statistiques
(
    id                   UUID,
    player_id            int,
    xp                   int,
    types_action_attaque int,
    types_action_defense int,
    victoire             int,
    timestamp_evenement  timestamp,
    PRIMARY KEY (player_id, id)
);
```

#### Colonnes principales :

• player_id : Identifiant unique du joueur.
• id : UUID de l'événement, utilisé pour garantir l'unicité et trier les événements par ordre chronologique.
• types_action_attaque, types_action_defense, victoire : Enregistre le type d’action effectuée par le joueur.
• xp : Points d’expérience gagnés lors de l’événement.
• timestamp_evenement : Date et heure de l’événement pour suivre les actions dans le temps.

#### Exemple de Données

Insertion de données de test pour des joueurs avec la totalité des actions :

```sql
INSERT INTO statistiques.cassandra_statistiques
    (id, player_id, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 1, 1, 1, '2024-11-06 12:00:00');
```

Insertion de données de test pour les joueurs avec des actions variées (ici seulement gain de victoire et de XP :

Utiliser toTimestamp(now()) pour générer un timestamp actuel au moment de l'insertion
4. Opérations CRUD
   • Création / Insertion : Les événements sont ajoutés pour chaque joueur avec un UUID généré aléatoirement.
   • Suppression : Suppression des données d’un joueur spécifique (ex : player_id = 2).



5. Déploiement et Exécution
   Pour initialiser et gérer la base de données :


6. Requêtes d’Agrégation pour les Classements
   L’analyse des données s’effectue par des requêtes d’agrégation pour obtenir des classements de joueurs par période et par type d’action. Ces classements sont essentiels pour suivre l’engagement et les performances des joueurs.
   Exemple de Requête pour les Totaux d’Actions et d’Expérience par Joueur


7. Fonctionnalités de Classement
   Un script sera exécuté pour générer les classements selon les totaux d’actions pour chaque joueur (attaques, défenses, victoires, xp). Les requêtes permettent de :
   • Obtenir les meilleurs scores par type d’action.
   • Filtrer les données par période via timestamp_evenement pour des périodes spécifiques (ex : les 30 derniers jours).
