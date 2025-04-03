$execute as @e[type=pig,tag=feat.balloon] if data entity @s {leash:{UUID:$(UUID)}} run data remove entity @s leash
