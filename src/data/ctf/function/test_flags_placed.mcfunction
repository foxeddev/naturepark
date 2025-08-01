as @n[type=marker,tag=ctf.field] at @s:
    scoreboard players set #flags temp 0
    scoreboard players operation #id temp = @s ctf.id
    as @e[type=marker,tag=ctf.red_flag] if score @s ctf.id = #id temp
        scoreboard players add #flags temp 1
    as @e[type=marker,tag=ctf.blue_flag] if score @s ctf.id = #id temp
        scoreboard players add #flags temp 1

    if score #flags temp matches 2:
        ./play

    scoreboard players reset #flags temp
    scoreboard players reset #id temp
