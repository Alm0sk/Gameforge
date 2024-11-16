from mongodata import MongoData

class Item(MongoData):
    objet_id : str
    famille_objet : str
    image : str
    nomstock : str
    description : str