data modify storage feat:balloon/update {} merge from entity @s SelectedItem.components.minecraft:custom_data.feat.balloon
$execute as @e[type=pig,tag=feat.balloon] if data entity @s {leash:{UUID:$(UUID)}} run function feat:balloon/update with storage feat:balloon/update
