as @n[type=marker,tag=ctf.field] at @s:
    scoreboard players operation #id temp = @s ctf.id
    as @a[tag=ctf.player] if score @s ctf.id = #id temp:
        tag @s add ctf.current_player

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
        positioned ~1 ~ ~ :
            function ./wall/remove

    # Reset

    scoreboard players reset #x temp
    scoreboard players reset #y temp
    scoreboard players reset #z temp

    scoreboard players reset #x_size temp
    scoreboard players reset #y_size temp
    scoreboard players reset #z_size temp

    kill @e[type=marker,tag=ctf.temp]

    as @a[tag=ctf.current_player] at @s:
        clear @s
        playsound entity.experience_orb.pickup master @s

    as @a[tag=ctf.current_player,tag=ctf.team_red]:
        title @s title {"color":"red","text":"Start!"}

    as @a[tag=ctf.current_player,tag=ctf.team_blue]:
        title @s title {"color":"blue","text":"Start!"}

    as @e[type=marker,tag=ctf.red_flag] if score @s ctf.id = #id temp at @s:
        summon interaction ~ ~ ~ {width:1f,height:2f,response:1b,Tags:["ctf.red_flag"]}

    as @e[type=marker,tag=ctf.blue_flag] if score @s ctf.id = #id temp at @s:
        summon interaction ~ ~ ~ {width:1f,height:2f,response:1b,Tags:["ctf.blue_flag"]}

    scoreboard players set @s ctf.state 2

    data remove storage ctf:temp m
    scoreboard players reset #id temp
    tag @a[tag=ctf.current_player] remove ctf.current_player
