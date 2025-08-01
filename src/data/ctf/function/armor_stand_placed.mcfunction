advancement revoke @s only ctf:armor_stand_placed

tag @s add ctf.placed_flag

schedule function ./armor_stand_placed/schedule 3t

function ./armor_stand_placed/schedule:
    as @a[tag=ctf.placed_flag]:
        tag @s remove ctf.placed_flag

        tag @s add ctf.current_player
        as @e[type=marker,tag=ctf.field] if score @s ctf.id = @a[tag=ctf.current_player,limit=1] ctf.id:
            tag @s add ctf.current_field
            scoreboard players operation #id temp = @s ctf.id

        if score @e[type=marker,tag=ctf.current_field,limit=1] ctf.state matches 1:
            if entity @s[tag=ctf.team_red] at @s:
                as @n[type=armor_stand,tag=ctf.red_flag]:
                    if data entity @s {OnGround:0b}:
                        as @a[tag=ctf.current_player]:
                            clear @s
                            loot give @s loot ctf:red_flag
                        kill @s
                        return 0

                    if data entity @s {OnGround:1b} at @s:
                        kill @s
                        as @e[tag=ctf.red_flag] if score @s ctf.id = #id temp:
                            kill @s

                        summon marker ~ ~ ~ {Tags:["ctf.red_flag"]}
                        summon block_display ~ ~ ~ {Tags:["ctf.red_flag"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,0f,-0.5f],scale:[1f,1f,1f]},block_state:{Name:"minecraft:red_banner"}}
                        data modify entity @e[type=block_display,tag=ctf.red_flag,limit=1] Rotation set from entity @s Rotation

                        as @e[tag=ctf.red_flag]:
                            scoreboard players operation @s ctf.id = #id temp

            if entity @s[tag=ctf.team_blue] at @s:
                as @n[type=armor_stand,tag=ctf.blue_flag]:
                    if data entity @s {OnGround:0b}:
                        as @a[tag=ctf.current_player]:
                            clear @s
                            loot give @s loot ctf:blue_flag
                        kill @s
                        return 0

                    if data entity @s {OnGround:1b} at @s:
                        kill @s
                        as @e[tag=ctf.blue_flag] if score @s ctf.id = #id temp:
                            kill @s

                        summon marker ~ ~ ~ {Tags:["ctf.blue_flag"]}
                        summon block_display ~ ~ ~ {Tags:["ctf.blue_flag"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,0f,-0.5f],scale:[1f,1f,1f]},block_state:{Name:"minecraft:blue_banner"}}
                        data modify entity @e[type=block_display,tag=ctf.blue_flag,limit=1] Rotation set from entity @s Rotation

                        as @e[tag=ctf.blue_flag]:
                            scoreboard players operation @s ctf.id = #id temp

        as @e[type=marker,tag=ctf.current_field]:
            function ./test_flags_placed

        scoreboard players reset #id temp
        tag @e[type=marker,tag=ctf.current_field] remove ctf.current_field
        tag @s remove ctf.current_player
