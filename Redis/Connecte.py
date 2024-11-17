import redis

def connecte_redis():
    # Connexion au conteneur Redis
    client = redis.Redis(
        host='localhost',  # ou l'adresse IP du conteneur Docker Redis
        port=6379,         # port par défaut de Redis
        db=0               # numéro de la base de données, 0 par défaut
    )
    return client

# Exemple de récupération de données
def get_data(key, client):
    value = client.get(key)  # récupère la valeur associée à 'key'
    if value:
        return value.decode("utf-8")  # décode la valeur en UTF-8
    return None

"""
# Exemple d'utilisation
key = "mon_cle"
valeur = get_data(key)
if valeur:
    print(f"La valeur de la clé '{key}' est : {valeur}")
else:
    print(f"Aucune valeur trouvée pour la clé '{key}'.")

"""