#!tag "minecraft:tick"

# Spawn balloon if player has item

as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{bln:{}}}}},tag=!bln.has_balloon]:
    function ./spawn
    tag @s add bln.has_balloon

as @a[tag=bln.has_balloon]:
    tag @s add bln.current_player

    data modify storage bln:temp UUID set from entity @s UUID
    as @e[type=pig,tag=bln.pig] at @s:
        store success score #success temp:
            data modify storage bln:temp UUID set from entity @s UUID
        if score #success temp matches 1:

            # Update balloon block displays

            on passengers:
                data modify entity @s block_state.Name set from entity @a[tag=bln.current_player,limit=1] SelectedItem.components.minecraft:custom_data.bln.block

            # Kill balloon if player doesn't hold item

            if entity @a[tag=bln.current_player,nbt=!{SelectedItem:{components:{"minecraft:custom_data":{bln:{}}}}}]:
                function ./destroy
                tag @a[tag=bln.current_player] remove bln.has_balloon

            # Kill balloons with too high distance to player to prevent lead snapping

            if entity @a[tag=bln.current_player,distance=8..]:
                function ./destroy
                tag @a[tag=bln.current_player] remove bln.has_balloon

        scoreboard players reset #success temp

    data remove storage bln:temp UUID

    tag @s remove bln.current_player
