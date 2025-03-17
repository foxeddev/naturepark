execute as @a run function feat:ballon/update_tag with entity @s

execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{feat:{ballon:{}}}}}},tag=!feat.has_ballon] at @s run \
function feat:ballon/spawn with entity @s SelectedItem.components.minecraft:custom_data.feat.ballon

execute as @a[tag=feat.has_ballon] run function feat:ballon/item_updated with entity @s

execute as @a[tag=feat.has_ballon] unless entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{feat:{ballon:{}}}}}}] run \
function feat:ballon/item_deselected with entity @s

execute as @e[type=pig,tag=feat.ballon] at @s unless data entity @s leash run function feat:ballon/destroy
