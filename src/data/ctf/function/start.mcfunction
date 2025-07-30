as @n[type=marker,tag=ctf.field] at @s:
    scoreboard players operation #id temp = @s ctf.id
    as @a[tag=ctf.queue] if score @s ctf.id = #id temp:
        tag @s add ctf.current_player
        tag @s remove ctf.queue

    scoreboard players reset #id temp

    data modify storage ctf:temp map set from entity @s data.ctf

    kill @e[type=armor_stand,tag=ctf.red_flag]
    kill @e[type=armor_stand,tag=ctf.blue_flag]

    ## Create wall

    # Get field position

    store result score #x temp run data get entity @s Pos[0]
    store result score #y temp run data get entity @s Pos[1]
    store result score #z temp run data get entity @s Pos[2]

    # Get field size

    store result score #x_size temp run data get entity @s data.ctf.size[0]
    store result score #y_size temp run data get entity @s data.ctf.size[1]
    store result score #z_size temp run data get entity @s data.ctf.size[2]

    # Calculate wall position

    scoreboard players operation #x_modifier temp = #x_size temp
    scoreboard players set #2 temp 2
    scoreboard players operation #x_modifier temp /= #2 temp
    scoreboard players operation #x temp += #x_modifier temp
    scoreboard players reset #2 temp
    scoreboard players reset #x_modifier temp

    summon marker ~ ~ ~ {Tags:["ctf.temp"]}
    as @e[type=marker,tag=ctf.temp,limit=1]:
        store result entity @s Pos[0] double 1 run scoreboard players get #x temp
        store result entity @s Pos[1] double 1 run scoreboard players get #y temp
        store result entity @s Pos[2] double 1 run scoreboard players get #z temp

    # Place walls

    at @e[type=marker,tag=ctf.temp] positioned ~-1 ~ ~:
        function ./wall/remove
        function ./wall/create_red
        positioned ~1 ~ ~ :
            function ./wall/create_blue

    # Reset

    scoreboard players reset #x temp
    scoreboard players reset #y temp
    scoreboard players reset #z temp

    scoreboard players reset #x_size temp
    scoreboard players reset #y_size temp
    scoreboard players reset #z_size temp

    kill @e[type=marker,tag=ctf.temp]

    # Tp players

    as @e[tag=ctf.spawn_team_red] if score @s ctf.id = #id temp:
        tp @a[tag=ctf.current_player,tag=ctf.team_red] @s
    as @e[tag=ctf.spawn_team_blue] if score @s ctf.id = #id temp:
        tp @a[tag=ctf.current_player,tag=ctf.team_blue] @s

    as @a[tag=ctf.current_player] at @s:
        gamemode adventure @s
        clear @s
        team leave @s
        playsound entity.experience_orb.pickup master @s # TODO: Add countdown
        tag @s add ctf.player

    as @a[tag=ctf.current_player,tag=ctf.team_red] at @s:
        team join ctf.red
        particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~1.5 ~ 0.1 0.1 0.1 0 64 force @s
        title @s subtitle {"color":"red","text":"Capture the flag | Team Red"}
        title @s title {"color":"red","nbt":"map.name","storage":"ctf:temp"}

    as @a[tag=ctf.current_player,tag=ctf.team_blue] at @s:
        team join ctf.blue
        particle dust{color:[0.000,0.000,1.000],scale:1} ~ ~1.5 ~ 0.1 0.1 0.1 0 64 force @s
        title @s subtitle {"color":"blue","text":"Capture the flag | Team Blue"}
        title @s title {"color":"blue","nbt":"map.name","storage":"ctf:temp"}

    as @r[tag=ctf.current_player,tag=ctf.team_red]: # Red flag hider
        loot give @s loot ctf:red_flag
        title @s actionbar "Hide the flag!"

    as @r[tag=ctf.current_player,tag=ctf.team_blue]: # Blue flag hider
        loot give @s loot ctf:blue_flag
        title @s actionbar "Hide the flag!"

    scoreboard players set @s ctf.state 1

    data remove storage ctf:temp map
    tag @a[tag=ctf.current_player] remove ctf.current_player
