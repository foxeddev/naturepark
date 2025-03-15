$execute as @e[type=pig,tag=feat.ballon] if data entity @s {leash:{UUID:$(UUID)}} run data remove entity @s leash
