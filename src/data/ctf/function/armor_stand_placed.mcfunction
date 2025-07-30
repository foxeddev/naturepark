advancement revoke @s only ctf:armor_stand_placed

tag @s add ctf.placed_flag

schedule function ./armor_stand_placed/schedule 3t

function ./armor_stand_placed/schedule:
    as @a[tag=ctf.placed_flag]:
        tag @s remove ctf.placed_flag

        tag @s add ctf.current_player
        as @e[type=marker,tag=ctf.field] if score @s ctf.id = @a[tag=ctf.current_player,limit=1] ctf.id:
            tag @s add ctf.current_field

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
                        summon marker ~ ~ ~ {Tags:["ctf.red_flag"]}
                        data merge entity @e[type=marker,tag=ctf.current_field,limit=1] {data:{ctf:{red_flag_placed:1b}}}

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
                        summon marker ~ ~ ~ {Tags:["ctf.blue_flag"]}
                        data merge entity @e[type=marker,tag=ctf.current_field,limit=1] {data:{ctf:{blue_flag_placed:1b}}}

        tag @e[type=marker,tag=ctf.current_field] remove ctf.current_field
        tag @s remove ctf.current_player

        as @e[type=marker,tag=ctf.current_field]:
            if data entity @s {data:{ctf:{red_flag_placed:1b,blue_flag_placed:1b}}} at @s:
                function ../play
