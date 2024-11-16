from mongodata import MongoData
from datetime import datetime
from typing import List, Optional

# Modele de joueur dans MongoDB
class Joueur(MongoData):
    player_id: str
    pseudo: str
    classe: str = []
    niveau: int = 0
    ids_competence: List[str] = []
    date_de_connexion: Optional[datetime]
    localisation: str = "x:0;z:0;y:0"
    inventaire: List[dict] = []
    