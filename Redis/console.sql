HSET player:1 PV 100
HSET player:1 PM 50
HSET player:1 Endurance 75
HSET player:1 Interaction "Attaque"
HSET player:1 Degat 30
HSET player:1 Cible "Monstre"
HSET player:1 Date_deplacement "2024-11-06 10:00:00"
HSET player:1 Coord_GPS "48.8566,2.3522"

HSET player:1 PM 50

HSET player:2 PV 200
HSET player:2 PM 30
HSET player:2 Endurance 95
HSET player:2 Interaction "Attaque"
HSET player:2 Degat 50
HSET player:2 Cible "Monstre"
HSET player:2 Date_deplacement "2024-11-06 11:00:00"
HSET player:2 Coord_GPS "49.8569,2.3522"

HSET player:3 PV 150
HSET player:3 PM 10
HSET player:3 Endurance 65
HSET player:3 Interaction "Attaque"
HSET player:3 Degat 35
HSET player:3 Cible "Monstre"
HSET player:3 Date_deplacement "2024-11-06 11:00:00"
HSET player:3 Coord_GPS "49.8569,2.3522"


HSET attack:1:2 Degats 25
HSET attack:1:2 Attack_id 4
HSET attack:1:2 Date_heure "2024-11-06 10:30:00"

HSET attack:2:3 Degats 50
HSET attack:2:3 Attack_id 3
HSET attack:2:3 Date_heure "2024-11-06 10:30:00"

HSET player_1 PV 100
HSET player_1 PM 50
HSET player_1 Endurance 75
HSET player_1 Interaction "Attaque"
HSET player_1 Degat 30
HSET player_1 Cible "Monstre"
HSET player_1 Date_deplacement "2024-11-06 10:00:00"
HSET player_1 Coord_GPS "48.8566,2.3522"

HSET move_1 Coord_GPS "48.8584,2.2945"
HSET move_1 Date_heure "2024-11-06 10:32:00"
EXPIRE move_1 30

HSET attack_1:2 Degats 25
HSET attack_1:2 Attack_id 4
HSET attack_1:2 Date_heure "2024-11-06 10:30:00"

ZADD interactions 1697078400 "player_1"

HSET move_2 Coord_GPS "48.8708,2.3469"
HSET move_2 Date_heure "2024-11-06 10:40:00"
EXPIRE move_2 20

HSET move_3 Coord_GPS "48.8566,2.3522"
HSET move_3 Date_heure "2024-11-06 10:42:00"
EXPIRE move_3 60

HSET attack:3:1 Degats 40
HSET attack:3:1 Attack_id 5
HSET attack:3:1 Date_heure "2024-11-06 11:00:00"
HSET attack:3:1 Type "Feu"

ZADD interactions 1697078400 "player_1"
ZADD interactions 1697078500 "player_2"
ZADD interactions 1697078600 "player_3"

ZINCRBY interactions 10 "player_1"
ZINCRBY interactions 20 "player_2"
ZINCRBY interactions 15 "player_3"
