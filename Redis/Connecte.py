import redis

def connecte_redis():
    # Connexion au conteneur Redis
    client = redis.Redis(
        host='localhost',
        port=6379,
        db=0
    )
    return client

# Exemple de récupération de données
def get_data(key, client):
    value = client.get(key)
    if value:
        return value.decode("utf-8")
    return None


# Exemple d'utilisation
key = "mon_cle"
valeur = get_data(key)
if valeur:
    print(f"La valeur de la clé '{key}' est : {valeur}")
else:
    print(f"Aucune valeur trouvée pour la clé '{key}'.")