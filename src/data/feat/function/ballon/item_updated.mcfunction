data modify storage feat:ballon/update {} merge from entity @s SelectedItem.components.minecraft:custom_data.feat.ballon
$execute as @e[type=pig,tag=feat.ballon] if data entity @s {leash:{UUID:$(UUID)}} run function feat:ballon/update with storage feat:ballon/update
