from mongodata import MongoData

class Competence(MongoData):
    comptence_id: str
    nom: str
    description: str
    niveau: int
    cooldown: int #ms