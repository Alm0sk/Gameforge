-- Supprimer le keyspace pour appliquer les modifications
DROP KEYSPACE IF EXISTS statistiques;

-- Le keyspace
CREATE KEYSPACE IF NOT EXISTS statistiques WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

-- Create a table
CREATE TABLE IF NOT EXISTS statistiques.cassandra_statistiques (
    id UUID,
    player_id int,
    xp int,
    types_action_attaque int,
    types_action_defense int,
    victoire int,
    timestamp_evenement timestamp,
    PRIMARY KEY (player_id, id)
);



-- Insert some data
INSERT INTO statistiques.cassandra_statistiques
(id, player_id, types_action_defense, victoire, timestamp_evenement)
VALUES (uuid(), 1, 1 , 1 ,'2024-11-06 12:00:00');

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


-- Select data

-- Total des victoires par joueur
SELECT player_id AS "ID joueur", sum(victoire) AS "Total victoires" FROM statistiques.cassandra_statistiques GROUP BY player_id;