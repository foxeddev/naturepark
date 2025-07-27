as @n[type=marker,tag=ctf.field] at @s:
    scoreboard players operation #id temp = @s ctf.id
    as @a[tag=ctf.player] if score @s ctf.id = #id temp:
        tag @s add ctf.current_player

    with entity @s data.ctf:
        $function ctf:load_map {map:"$(map)/open"}
        $data modify storage ctf:temp m set from storage ctf:maps maps.$(map)

    as @a[tag=ctf.current_player] at @s:
        clear @s
        playsound entity.experience_orb.pickup master @s

    as @a[tag=ctf.current_player,tag=ctf.team_red] at @s:
        give @s stone_axe[can_break=[{blocks:"blue_banner"}]]
        title @s title {"color":"red","nbt":"m.name","storage":"ctf:temp"}

    as @a[tag=ctf.current_player,tag=ctf.team_red] at @s:
        give @s stone_axe[can_break=[{blocks:"blue_banner"}]]
        title @s title {"color":"blue","nbt":"m.name","storage":"ctf:temp"}

    scoreboard players set @s ctf.state 2

    data remove storage ctf:temp m
    scoreboard players reset #id temp
    tag @a[tag=ctf.current_player] remove ctf.current_player
