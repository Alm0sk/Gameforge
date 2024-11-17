import redis
from datetime import datetime, timezone, timedelta

# Connexion au serveur Redis
r = redis.Redis(host='localhost', port=6379, db=0)


attacker_id = 1
target_id = 2
damage = 50
attack_id = "abc123"
timestamp = datetime.now(timezone.utc).isoformat()

try:
    # Affichage des valeurs pour débogage
    print(f"Attacker ID: {attacker_id}, Target ID: {target_id}")
    print(f"Damage: {damage}, Attack ID: {attack_id}, Timestamp: {timestamp}")



    # Enregistrement des données dans Redis
    r.hset(f"attack:{attacker_id}:{target_id}", "damage", damage)
    r.hset(f"attack:{attacker_id}:{target_id}", "attack_id", attack_id)
    r.hset(f"attack:{attacker_id}:{target_id}", "timestamp", timestamp)
    print("Données enregistrées avec succès.")
except Exception as e:
    print(f"Erreur lors de l'enregistrement dans Redis : {e}")


def add_interaction(player_id):

    try:
        timestamp = datetime.now(timezone.utc).timestamp()
        r.zadd("player_interactions", {player_id: timestamp})
        print(f"Interaction ajoutée pour le joueur {player_id}.")
    except Exception as e:
        print(f"Erreur lors de l'ajout de l'interaction : {e}")


def cleanup_old_interactions():
    """
    Supprime les interactions de plus de 24 heures.
    """
    try:
        cutoff_time = (datetime.now(timezone.utc) - timedelta(hours=24)).timestamp()
        r.zremrangebyscore("player_interactions", "-inf", cutoff_time)
        print("Interactions de plus de 24 heures nettoyées.")
    except Exception as e:
        print(f"Erreur lors du nettoyage des anciennes interactions : {e}")


def get_leaderboard():

    """
    Récupère le classement des joueurs sur les 24 dernières heures.
    """
    try:
        now = datetime.now(timezone.utc).timestamp()
        interactions = r.zrevrangebyscore("player_interactions", now, "-inf", withscores=True)
        leaderboard = {player.decode("utf-8"): score for player, score in interactions}
        return leaderboard
    except Exception as e:
        print(f"Erreur lors de la récupération du classement : {e}")
        return {}


# Exemple d'utilisation
player_id = 1
add_interaction(player_id)
cleanup_old_interactions()
leaderboard = get_leaderboard()
print("Classement des joueurs (24h) :", leaderboard)