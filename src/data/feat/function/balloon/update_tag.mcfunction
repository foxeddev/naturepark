$execute unless entity @e[type=pig,tag=feat.balloon,nbt={leash:{UUID:$(UUID)}}] run tag @s remove feat.has_balloon
$execute if entity @e[type=pig,tag=feat.balloon,nbt={leash:{UUID:$(UUID)}}] run tag @s add feat.has_balloon
