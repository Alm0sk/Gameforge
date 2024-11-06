-- Le keyspace
CREATE KEYSPACE IF NOT EXISTS statistiques WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

--