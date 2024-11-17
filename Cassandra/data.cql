-- Supprimer le keyspace pour appliquer les modifications
DROP KEYSPACE IF EXISTS statistiques;

-- Le keyspace
CREATE KEYSPACE IF NOT EXISTS statistiques WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

-- Création de la table
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

-- Insertion de données
INSERT INTO statistiques.cassandra_statistiques
    (id, player_id, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 1, 1, 1, '2024-11-06 12:00:00');

INSERT INTO statistiques.cassandra_statistiques
    (id, player_id, types_action_attaque, xp, timestamp_evenement)
VALUES (uuid(), 1, 1, 10, '2024-11-06 12:00:01');

INSERT INTO statistiques.cassandra_statistiques
    (id, player_id, victoire, timestamp_evenement)
VALUES (uuid(), 1, 1, '2024-11-06 12:00:02');

INSERT INTO statistiques.cassandra_statistiques
    (id, player_id, types_action_attaque, timestamp_evenement)
VALUES (uuid(), 1, 1, '2024-11-06 12:00:03');

INSERT INTO statistiques.cassandra_statistiques
    (id, player_id, xp, victoire, timestamp_evenement)
VALUES (uuid(), 1, 10, 1, '2024-11-06 12:00:04');

INSERT INTO statistiques.cassandra_statistiques
    (id, player_id, types_action_defense, timestamp_evenement)
VALUES (uuid(), 2, 1, '2024-11-06 12:00:04');

INSERT INTO statistiques.cassandra_statistiques
    (id, player_id, types_action_attaque, xp, timestamp_evenement)
VALUES (uuid(), 2, 1, 10, '2024-11-06 12:00:05');

INSERT INTO statistiques.cassandra_statistiques
    (id, player_id, types_action_attaque, xp, timestamp_evenement)
VALUES (uuid(), 2, 1, 20, '2024-11-06 12:00:05');


-- Insertion de données pour un troisième joueur en dehors du mois de novembre pour verifier que le classement ne prend en compte que les données du mois de novembre
INSERT INTO statistiques.cassandra_statistiques
    (id, player_id, types_action_attaque, xp, timestamp_evenement)
VALUES (uuid(), 3, 1, 20, '2024-12-06 12:00:05');

INSERT INTO statistiques.cassandra_statistiques
    (id, player_id, types_action_attaque, xp, timestamp_evenement)
VALUES (uuid(), 3, 1, 20, '2024-10-06 12:00:05');


-- Données supplémentaires pour générée par IA
-- Génération de données pour novembre 2024 (jours du 4 au 8)
INSERT INTO statistiques.cassandra_statistiques (id, player_id, types_action_attaque, xp, timestamp_evenement)
VALUES (uuid(), 1, 1, 10, '2024-11-04 08:00:00');

INSERT INTO statistiques.cassandra_statistiques (id, player_id, types_action_defense, xp, timestamp_evenement)
VALUES (uuid(), 1, 1, 15, '2024-11-04 09:30:00');

INSERT INTO statistiques.cassandra_statistiques (id, player_id, victoire, timestamp_evenement)
VALUES (uuid(), 2, 1, '2024-11-04 11:00:00');

INSERT INTO statistiques.cassandra_statistiques (id, player_id, types_action_attaque, xp, timestamp_evenement)
VALUES (uuid(), 2, 1, 20, '2024-11-05 08:15:00');

INSERT INTO statistiques.cassandra_statistiques (id, player_id, types_action_defense, xp, timestamp_evenement)
VALUES (uuid(), 4, 1, 25, '2024-11-05 10:45:00');

INSERT INTO statistiques.cassandra_statistiques (id, player_id, victoire, timestamp_evenement)
VALUES (uuid(), 4, 1, '2024-11-05 13:00:00');

INSERT INTO statistiques.cassandra_statistiques (id, player_id, types_action_attaque, xp, timestamp_evenement)
VALUES (uuid(), 4, 1, 30, '2024-11-06 07:30:00');

INSERT INTO statistiques.cassandra_statistiques (id, player_id, types_action_defense, xp, timestamp_evenement)
VALUES (uuid(), 4, 1, 35, '2024-11-06 09:45:00');

INSERT INTO statistiques.cassandra_statistiques (id, player_id, victoire, timestamp_evenement)
VALUES (uuid(), 5, 1, '2024-11-06 12:00:00');

INSERT INTO statistiques.cassandra_statistiques (id, player_id, types_action_attaque, xp, timestamp_evenement)
VALUES (uuid(), 5, 1, 40, '2024-11-07 08:00:00');

INSERT INTO statistiques.cassandra_statistiques (id, player_id, types_action_defense, xp, timestamp_evenement)
VALUES (uuid(), 6, 1, 45, '2024-11-07 10:30:00');

INSERT INTO statistiques.cassandra_statistiques (id, player_id, victoire, timestamp_evenement)
VALUES (uuid(), 6, 1, '2024-11-07 13:15:00');

INSERT INTO statistiques.cassandra_statistiques (id, player_id, types_action_attaque, xp, timestamp_evenement)
VALUES (uuid(), 7, 1, 50, '2024-11-08 09:00:00');

INSERT INTO statistiques.cassandra_statistiques (id, player_id, types_action_defense, xp, timestamp_evenement)
VALUES (uuid(), 7, 1, 55, '2024-11-08 11:30:00');

INSERT INTO statistiques.cassandra_statistiques (id, player_id, victoire, timestamp_evenement)
VALUES (uuid(), 8, 1, '2024-11-08 14:00:00');
