# Spawn balloon if player has item

execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{feat:{balloon:{}}}}}},tag=!feat.has_balloon]:
    function ./spawn
    tag @s add feat.has_balloon

# Update balloon

execute as @a[tag=feat.has_balloon] with entity @s:
    $execute as @e[type=pig,tag=feat.balloon,nbt={leash:{UUID:$(UUID)}}] on passengers run \
    data modify entity @s block_state set from entity @a[nbt={UUID:$(UUID)},limit=1] SelectedItem.components.minecraft:custom_data.feat.balloon.block

# Remove balloon if player doesn't have item

execute as @a[tag=feat.has_balloon] unless entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{feat:{balloon:{}}}}}}] with entity @s:
    $execute as @e[type=pig,tag=feat.balloon,nbt={leash:{UUID:$(UUID)}}] run function ./destroy
    tag @s remove feat.has_balloon

# Remove all balloons without lead

execute as @e[type=pig,tag=feat.balloon] at @s unless data entity @s leash run function ./destroy
