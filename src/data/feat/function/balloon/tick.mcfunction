execute as @a run function feat:balloon/update_tag with entity @s

execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{feat:{balloon:{}}}}}},tag=!feat.has_balloon] at @s run \
function feat:balloon/spawn with entity @s SelectedItem.components.minecraft:custom_data.feat.balloon

execute as @a[tag=feat.has_balloon] run function feat:balloon/item_updated with entity @s

execute as @a[tag=feat.has_balloon] unless entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{feat:{balloon:{}}}}}}] run \
function feat:balloon/item_deselected with entity @s

execute as @e[type=pig,tag=feat.balloon] at @s unless data entity @s leash run function feat:balloon/destroy
