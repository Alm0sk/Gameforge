from joueur import Joueur
from item import Item
from competence import Competence
from datetime import datetime
from pymongo import MongoClient

# connexion mongodb
MONGO_CLIENT = MongoClient("mongodb://localhost:27017/")
MONGO_DATABASE = MONGO_CLIENT["GameData"]
COL_PLAYERS = MONGO_DATABASE["player_data"]
COL_ITEMS = MONGO_DATABASE["item_for_inventory"]
COL_COMPET = MONGO_DATABASE["player_competence"]

Joueur.set_collection(COL_PLAYERS)
Item.set_collection(COL_ITEMS)
Competence.set_collection(COL_COMPET)

# ---------- operations crud pour item ----------
print("------------- Item -----------")

# creation d'un item
nouvel_item = Item(
    objet_id="IDI098",
    famille_objet="potion",
    image="./potion_bleue.png",
    nomstock="potion bleue",
    description="ajoute +50 mana"
)
nouvel_item.save()
print(">>> item cree :\n", nouvel_item)

# lecture d'un item
item_id = nouvel_item.mongo_id  # en supposant que cet id est connu
item_retrouve = Item.get(str(item_id))
print(">>> item retrouve :\n", item_retrouve)

# mise a jour d'un item
if item_retrouve:
    item_retrouve.description = "ajoute +75 mana"  # changer la description de l'item
    item_retrouve.save()
    print(">>> item mis a jour description :\n", Item.get(str(item_id)))

# suppression d'un item
if item_retrouve:
    item_retrouve.delete()
    print(">>> item supprime :\n", Item.get(str(item_id)))  # devrait afficher none


# ---------- operations crud pour joueur ----------
print("------------- Joueur -----------")

# creation d'un joueur
nouveau_joueur = Joueur(
    player_id="12345",
    pseudo="superhack3r",
    classe="archimage",
    niveau=300,
    ids_competence=["IDC1"],
    date_de_connexion=datetime.now(),
    localisation="x:0;z:0;y:0",
    inventaire=[{"item_id": "IDI098", "tag": {"time_used":"1/3"}}]
)
nouveau_joueur.save()
print(">>> joueur cree :\n", nouveau_joueur)

# lecture d'un joueur
player_id = nouveau_joueur.mongo_id  # en supposant que cet id est connu
joueur_retrouve = Joueur.get(str(player_id))
print(">>> joueur retrouve :\n", joueur_retrouve)

# mise a jour d'un joueur
if joueur_retrouve:
    joueur_retrouve.niveau = 301  # augmenter le niveau du joueur
    joueur_retrouve.save()
    print(">>> joueur mis a jour :\n", Joueur.get(str(player_id)))

# suppression d'un joueur
if joueur_retrouve:
    joueur_retrouve.delete()
    print(">>> joueur supprime :\n", Joueur.get(str(player_id)))  # devrait afficher none


# ---------- operations crud pour competence ----------
print("------------- Competence -----------")

# creation d'une competence
nouvelle_competence = Competence(
    comptence_id="IDC1",
    nom="Fireball Power",
    description="Lance une boule de feu vers l'enemie visee",
    niveau=20,
    cooldown=500
)
nouvelle_competence.save()
print(">>> competence cree :\n", nouvelle_competence)

# lecture d'une competence
competence_id = nouvelle_competence.mongo_id  # en supposant que cet id est connu
competence_retrouvee = Competence.get(str(competence_id))
print(">>> competence retrouvee :\n", competence_retrouvee)

# mise a jour d'une competence
if competence_retrouvee:
    competence_retrouvee.niveau = 10  # mettre a jour le niveau
    competence_retrouvee.save()
    print(">>> competence mise a jour :\n", Competence.get(str(competence_id)))

# suppression d'une competence
if competence_retrouvee:
    competence_retrouvee.delete()
    print(">>> competence supprimee :\n", Competence.get(str(competence_id)))  # devrait afficher none
