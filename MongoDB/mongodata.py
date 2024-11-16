from bson.objectid import ObjectId
from pydantic import BaseModel, model_validator, Field
from typing import List, Optional, ClassVar
from pymongo.collection import Collection


# Modele de data dans MongoDB
class MongoData(BaseModel):
    mongo_id: Optional[ObjectId] = Field(default=None,alias="_id")
    mongo_collection : ClassVar[Collection] = None

    @classmethod
    def set_collection(cls, collection):
        """Définit la collection MongoDB à utiliser pour la classe."""
        cls.mongo_collection = collection
        
    class Config:
        arbitrary_types_allowed = True
        json_encoders = {ObjectId: str}  # Convertir ObjectId -> string pour la compatibilité JSON

    @classmethod #static
    def get(cls, _id: str) -> Optional["MongoData"]:
        """Charge un document à partir de la collection MongoDB en utilisant son _id."""
        mong_data = cls.mongo_collection.find_one({"_id": ObjectId(_id)})
        if mong_data:
            return cls(**mong_data)
        return None

    @classmethod #static
    def getAll(cls) -> List["MongoData"]:
        """Charge tous les documents depuis MongoDB et retourne une liste d'instance."""
        mongo_data = cls.mongo_collection.find()  # Récupère tous les documents de la collection
        return [cls(**data) for data in mongo_data]  # Crée une instance pour chaque document recuperer

    
    def save(self):
        """Enregistre ou met à jour le document dans la collection de MongoDB."""
        if self.mongo_id:
            # Met à jour le document existant
            self.mongo_collection.update_one(
                {"_id": self.mongo_id},
                {"$set": self.model_dump(exclude={"mongo_id"})},
                upsert=True
            )
        else:
            # Insère un nouveau document et génère automatiquement un ObjectId
            result = self.mongo_collection.insert_one(self.model_dump(exclude={"mongo_id"}))
            self.mongo_id = result.inserted_id  # Stocke le nouvel ID directement sous forme d'ObjectId
        
    
    def delete(self):
        """Supprime le document dans la collection MongoDB."""
        if self.mongo_id:
            result = self.mongo_collection.delete_one({"_id": self.mongo_id})
            if result.deleted_count == 0:
                raise ValueError(f"Aucun document trouvé avec l'ID {self.mongo_id} pour suppression.")
    
    
    def __str__(self):
        reprstr = ""    
        for key,value in self.__dict__.items():
            reprstr += f"{key}: {value}\n"
        return reprstr
                
            