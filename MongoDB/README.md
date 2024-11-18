
# Documentation Technique : **GameData**  

## Introduction  

Le projet utilise MongoDB pour gérer les données relatives aux joueurs, compétences et objets du jeu *Gameforge*. La base de données, nommée `GameData`, est composée de trois collections :  

1. **`player_data`** : Informations des joueurs.  
2. **`item_for_inventory`** : Objets disponibles pour l'inventaire des joueurs.  
3. **`player_competence`** : Liste des compétences disponibles dans le jeu.  

L'intégration de ces données est réalisée avec des opérations CRUD grâce à une couche métier développée en Python. Cette couche repose sur les modules :  
- **`pymongo`** pour l'interaction avec MongoDB.  
- **`pydantic`** pour la validation et la sérialisation des modèles de données.  

## Structure de la Base de Données  

### Collection : **`player_data`**  
- `_id` : Identifiant de l'objet dans la collection mongodb
- `player_id`: Identifiant qui caractérise le joueur pour le lié aux autre données des autres base de données grâce à la couche métier.
- `pseudo`: Le pseudonyme de l'utilisateur
- `classe`: La classe que possède le joueur
- `niveau`: Le niveau que possède le joueur
- `ids_competence`: Liste d'identifiant des compétences (`id_competence`) que possédé le joueur. On liera le nom de compétences et de l'ensemble des capacités dans la collection `player_competence`.
- `date_de_connexion`: dernière date de connexion du joueur au jeu
- `localisation`: dernière localisation du joueur dans le jeu
- `inventaire`: liste d'objet contenant l'ensemble des identifiants des objets `id_objet` que contient le joueur et leurs informations spécifique aux joueurs.

### Collection : **`item_for_inventory`**  
- `_id` : Identifiant de l'objet dans la collection mongodb
- `objet_id` : Identifiant qui caractérise l'objet pour le lié aux autre données des autres base de données grâce à la couche métier.
- `famille_objet`: Le type de l'objet (ex: potion, épée, outils)
- `image`: Le chemin de l'image (ex: /img/potion.png)
- `nomstock`: Le nom de l'objet
- `description`: La description de l'objet

### Collection : **`player_competence`**  
- `_id`: Identifiant de l'objet dans la collection mongodb
- `objet_id`: Identifiant qui caractérise la compétence pour le lié aux autre données des autres base de données grâce à la couche métier
- `nom`: Nom de la compétence
 - `description`: Description de la compétence
- `niveau`: Niveau ou la compétence peut être débloqué
- `cooldown`: Le temps en milliseconde ou la compétence ne peut être réutilisé

## Architecture du Code  

## Installation et Configuration  

Installation des Dépendances et de l'environnement virtuel python pour tester le crud.

```bash
python -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install pydantic pymongo
```

### **Classe Mère** : `MongoData`  
**Fichier** : `mongodata.py`  

- **Description** : Classe mère permettant de gérer les interactions avec MongoDB.  
- **Attributs** :  
  - `mongo_id`: Identifiant unique (`_id` dans MongoDB).  
  - `mongo_collection`: Collection MongoDB associée.  
- **Méthodes principales** :  
  - `set_collection`: Associe une collection MongoDB à la classe.  
  - `get`: Récupère un document par son identifiant.  
  - `getAll`: Récupère tous les documents de la collection.  
  - `save`: Ajoute ou met à jour un document.  
  - `delete`: Supprime un document.  

### **Sous-Classes **  

#### **`Competence`**  
**Fichier** : `competence.py`  

```python
class Competence(MongoData):
    comptence_id: str
    nom: str    
    description: str
    niveau: int
    cooldown: int  # En millisecondes
```

#### **`Item`**  
**Fichier** : `item.py`  

```python
class Item(MongoData):
    objet_id: str
    famille_objet: str
    image: str
    nomstock: str
    description: str
```

#### **`Joueur`**  
**Fichier** : `joueur.py`  

```python
class Joueur(MongoData):
    player_id: str
    pseudo: str
    classe: str = []
    niveau: int = 0
    ids_competence: List[str] = []
    date_de_connexion: Optional[datetime]
    localisation: str = "x:0;z:0;y:0"
    inventaire: List[dict] = []
```

## Le Code

### Configuration MongoDB  

```python
from pymongo import MongoClient

MONGO_CLIENT = MongoClient("mongodb://localhost:27017/")
MONGO_DATABASE = MONGO_CLIENT["GameData"]

# Collections
COL_PLAYERS = MONGO_DATABASE["player_data"]
COL_ITEMS = MONGO_DATABASE["item_for_inventory"]
COL_COMPET = MONGO_DATABASE["player_competence"]

# Liaison des collections
Joueur.set_collection(COL_PLAYERS)
Item.set_collection(COL_ITEMS)
Competence.set_collection(COL_COMPET)
```

### Opérations CRUD 
Ces exemples sont issues du fichier [test_crud.py](https://github.com/Alvin-Kita/Gameforge/blob/master/MongoDB/test_crud.py)

#### **Création d’un objet**  

```python
nouvel_item = Item(
    objet_id="IDI098",
    famille_objet="potion",
    image="./potion_bleue.png",
    nomstock="Potion Bleue",
    description="Ajoute +50 mana"
)
nouvel_item.save()
```

#### **Création d’un joueur**  

```python
nouveau_joueur = Joueur(
    player_id="12345",
    pseudo="SuperHack3r",
    classe="Archimage",
    niveau=300,
    ids_competence=["IDC1"],
    date_de_connexion=datetime.now(),
    localisation="x:0;z:0;y:0",
    inventaire=[{"item_id": "IDI098", "tag": {"time_used": "1/3"}}]
)
nouveau_joueur.save()
```

#### **Création d’une compétence**  

```python
nouvelle_competence = Competence(
    comptence_id="IDC1",
    nom="Fireball Power",
    description="Lance une boule de feu vers l’ennemi visé",
    niveau=20,
    cooldown=500
)
nouvelle_competence.save()
```


