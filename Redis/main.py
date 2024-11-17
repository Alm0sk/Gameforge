import redis
from datetime import datetime
from leaderboard import add_interaction, cleanup_old_interactions, get_leaderboard
from Connecte import get_data, connecte_redis

connecte_redis()
r = redis.Redis()

# Ajouter un déplacement avec TTL
player_id = 1
coord_gps = "48.8584,2.2945"
timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
r.setex(f"move:{player_id}", 60, f"{coord_gps}|{timestamp}")

# Ajouter une attaque
attacker_id = 1
target_id = 2
damage = 25
attack_id = 4
timestamp = "2024-11-06 10:30:00"
r.hset(f"attack: {attacker_id}: {target_id}", mapping={
    "damage": damage,
    "attack_id": attack_id,
    "timestamp": timestamp
})

# Ajouter une interaction pour le classement sur 24h
add_interaction(player_id)

# Nettoyer les interactions de plus de 24h
cleanup_old_interactions()

# Récupérer le classement
leaderboard = get_leaderboard()
print("Classement des joueurs (24h) :", leaderboard)
