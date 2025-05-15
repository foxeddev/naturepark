kill @e[type=marker,tag=ctf.field,distance=..0.5]
$summon marker ~ ~ ~ {Tags:["ctf.field","ctf.new"],data:{ctf:{map:$(map)}}}
execute as @e[type=marker,tag=ctf.new]:
    scoreboard players set #i temp 0

    function ./create_field/loop:
        scoreboard players add #i temp 1
        scoreboard players reset #used temp
        execute as @e[tag=ctf.field] if score @s ctf.id = #i temp:
            scoreboard players set #used temp 1
        execute if score #used temp matches 1 run function ./create_field/loop

    function ./create_field/loop
    scoreboard players operation @s ctf.id = #i temp

    function ./reset_field
    tellraw @p[gamemode=creative] [{"color":"green","text":"New field created with id "},{"score":{"name":"@s","objective":"ctf.id"}}]
    tag @s remove ctf.new
