### Lancer le container Docker

```bash
docker compose up -d
```
*La commande lancera un serveur Cassandra, MongoDB et Redis, sur leur port par défaut*


### Entrer dans le container

#### Cassandra
```bash
docker exec -it cassandra cqlsh
```

### Arrêter le container Docker

```bash
docker compose down
```