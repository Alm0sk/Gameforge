-- Supprimer le keyspace pour appliquer les modifications
DROP KEYSPACE IF EXISTS statistiques;

-- Le keyspace
CREATE KEYSPACE IF NOT EXISTS statistiques WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

-- Create a table
CREATE TABLE IF NOT EXISTS statistiques.cassandra_statistiques (
    id UUID PRIMARY KEY,
    player_id int,
    xp int,
    types_action_attaque int,
    types_action_defense int,
    victoire int,
    timestamp_evenement timestamp
);

-- Insert some data
INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque,types_action_defense,victoire,timestamp_evenement)
VALUES (uuid(),1,15,1,0,0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 1, 23, 1, 0, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 1, 30, 0, 1, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 1, 36, 1, 0, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 1, 36, 0, 1, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 2, 12, 1, 0, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 2, 16, 0, 1, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 2, 23, 1, 0, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 2, 24, 0, 1, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 3, 10, 1, 0, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 3, 15, 0, 1, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 3, 17, 1, 0, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 3, 21, 0, 1, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 1, 40, 1, 0, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 1, 46, 0, 1, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 2, 24, 1, 0, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 2, 29, 0, 1, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 3, 21, 1, 0, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 3, 26, 0, 1, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 1, 46, 1, 0, 0, toTimeStamp(now()));

INSERT INTO statistiques.cassandra_statistiques
(id, player_id, xp, types_action_attaque, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 1, 58, 0, 1, 0, toTimeStamp(now()));
