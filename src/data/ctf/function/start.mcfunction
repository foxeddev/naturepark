as @n[type=marker,tag=ctf.field] at @s:
    function ./reset_field

    scoreboard players operation #id temp = @s ctf.id
    as @a[tag=ctf.queue] if score @s ctf.id = #id temp:
        tag @s add ctf.current_player
        tag @s remove ctf.queue

    with entity @s data.ctf:
        $data modify storage ctf:temp m set from storage ctf:maps maps.$(map)

    with storage ctf:temp m:
        $execute as @e[tag=ctf.spawn_team_red,$(distance_area)] run scoreboard players operation @s ctf.id = #id temp
        $execute as @e[tag=ctf.spawn_team_blue,$(distance_area)] run scoreboard players operation @s ctf.id = #id temp

    as @e[tag=ctf.spawn_team_red] if score @s ctf.id = #id temp:
        tp @a[tag=ctf.current_player,tag=ctf.team_red] @s
    as @e[tag=ctf.spawn_team_blue] if score @s ctf.id = #id temp:
        tp @a[tag=ctf.current_player,tag=ctf.team_blue] @s

    as @a[tag=ctf.current_player] at @s:
        gamemode adventure @s
        clear @s
        playsound entity.experience_orb.pickup master @s # Add countdown
        tag @s add ctf.player

    as @a[tag=ctf.current_player,tag=ctf.team_red] at @s:
        particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~1.5 ~ 0.1 0.1 0.1 0 64 force @s
        title @s subtitle {"color":"red","text":"Capture the flag | Team Red"}
        title @s title {"color":"red","nbt":"m.name","storage":"ctf:temp"}

    as @a[tag=ctf.current_player,tag=ctf.team_blue] at @s:
        particle dust{color:[0.000,0.000,1.000],scale:1} ~ ~1.5 ~ 0.1 0.1 0.1 0 64 force @s
        title @s subtitle {"color":"blue","text":"Capture the flag | Team Blue"}
        title @s title {"color":"blue","nbt":"m.name","storage":"ctf:temp"}

    as @r[tag=ctf.current_player,tag=ctf.team_red]: # Red flag hider
        loot give @s loot ctf:red_flag
        title @s actionbar "Hide the flag!"

    as @r[tag=ctf.current_player,tag=ctf.team_blue]: # Blue flag hider
        loot give @s loot ctf:blue_flag
        title @s actionbar "Hide the flag!"

    scoreboard players set @s ctf.state 1

data remove storage ctf:temp m
scoreboard players reset #id temp
tag @a[tag=ctf.current_player] remove ctf.current_player
