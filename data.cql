-- Le keyspace
CREATE KEYSPACE IF NOT EXISTS statistiques WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

---- Create a keyspace
CREATE KEYSPACE IF NOT EXISTS statistique WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : '1' };

-- Create a table
CREATE TABLE IF NOT EXISTS cassandra_statistiques (
      id int PRIMARY KEY,
      player_id int,
      xp int,
      types_action_attaque int,
      types_action_defense int,
      victoire int,
      timestamp_evenement timestamp
);

-- Insert some data
INSERT INTO cassandra_statistiques
(player_id, xp, types_action_attaque,types_action_defense,victoire,timestamp_evenement)
VALUES ('1','1','1','0','0', toTimeStamp(now()));

INSERT INTO cassandra_statistiques
(player_id, xp, types_action_attaque,types_action_defense,victoire,timestamp_evenement)
VALUES ('1', '1','0','1','0', toTimeStamp(now()));

INSERT INTO cassandra_statistiques
(player_id, xp, types_action_attaque,types_action_defense,victoire,timestamp_evenement)
VALUES ('1','1','1','0','0', toTimeStamp(now()));


