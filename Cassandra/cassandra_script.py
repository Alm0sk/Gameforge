from cassandra.cluster import Cluster
from datetime import datetime

# Configuration de la connexion
cluster = Cluster(['127.0.0.1'])
session = cluster.connect('statistiques')

# Période de temps pour les statistiques (ici le mois de novembre 2024)
start_date = datetime(2024, 11, 1, 0, 0, 0)
end_date = datetime(2024, 12, 1, 0, 0, 0)

# Requête d'agrégation
query = """
SELECT player_id                 AS "ID joueur",
       sum(victoire)             AS "Total victoires",
       sum(types_action_attaque) AS "Total attaques",
       sum(types_action_defense) AS "Total défenses",
       sum(xp)                   AS "Total XP"
FROM cassandra_statistiques
WHERE timestamp_evenement >= %s AND timestamp_evenement <= %s
GROUP BY player_id
ALLOW FILTERING;
"""

print("")
print("Affichage des statistiques pour le mois de novembre 2024")

### Exécution des requêtes

# Résultats sans classement
print("")
print("Affichage des résultats sans classement")
rows = session.execute(query, (start_date, end_date))

print(f"{'ID joueur':<10} {'Total victoires':<15} {'Total attaques':<15} {'Total défenses':<15} {'Total XP':<10}")
for row in rows:
    print(f"{row[0]:<10} {row[1]:<15} {row[2]:<15} {row[3]:<15} {row[4]:<10}")
print("")

print("-------------------")
print("")

print("Affichage des résultats avec classement")
print("")

# Résultats par xp
print("Classement des Joueurs par xp")
rows = session.execute(query, (start_date, end_date))
sorted_rows = sorted(rows, key=lambda row: row[4], reverse=True)

print(f"{'ID joueur':<10} {'Total victoires':<15} {'Total attaques':<15} {'Total défenses':<15} {'Total XP':<10}")
for row in sorted_rows:
    print(f"{row[0]:<10} {row[1]:<15} {row[2]:<15} {row[3]:<15} {row[4]:<10}")

# Fermeture de la connexion
cluster.shutdown()