import time
import redis

r = redis.Redis()

def add_interaction(player_id):
    timestamp = int(time.time())  # Horodatage UNIX
    r.zadd("interactions", {player_id: timestamp})

def cleanup_old_interactions():
    twenty_four_hours_ago = int(time.time()) - 86400  # Horodatage UNIX il y a 24 heures
    r.zremrangebyscore("interactions", 0, twenty_four_hours_ago)

def get_leaderboard():
    twenty_four_hours_ago = int(time.time()) - 86400
    # Récupérer les joueurs actifs des 24 dernières heures avec leur score
    leaderboard = r.zrangebyscore("interactions", twenty_four_hours_ago, int(time.time()), withscores=True)
    return sorted(leaderboard, key=lambda x: x[1], reverse=True)  # Trier par score décroissant
