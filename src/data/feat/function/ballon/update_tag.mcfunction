$execute unless entity @e[type=pig,tag=feat.ballon,nbt={leash:{UUID:$(UUID)}}] run tag @s remove feat.has_ballon
$execute if entity @e[type=pig,tag=feat.ballon,nbt={leash:{UUID:$(UUID)}}] run tag @s add feat.has_ballon
