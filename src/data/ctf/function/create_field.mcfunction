# Create a new CTF field
#
# Usage: `/function ctf:create_field {id:<id>,name:<name>,size:<size>}`

kill @e[type=marker,tag=ctf.field,distance=..0.5]
$summon marker ~ ~ ~ {Tags:["ctf.field","ctf.new"],Scores:{ctf.state:0},data:{ctf:{id:"$(id)",name:"$(name)",size:$(size)},name:"$(name) - CTF Map"}} # Name if for Axiom
as @e[type=marker,tag=ctf.new]:

    # Find unused field id

    scoreboard players set #i temp 0

    function ./create_field/loop:
        scoreboard players add #i temp 1
        scoreboard players reset #used temp
        as @e[tag=ctf.field] if score @s ctf.id = #i temp:
            scoreboard players set #used temp 1
        if score #used temp matches 1 run function ./create_field/loop

    function ./create_field/loop
    scoreboard players operation @s ctf.id = #i temp

    tellraw @p[gamemode=creative] [{"color":"green","text":"New field created with id "},{"score":{"name":"@s","objective":"ctf.id"}}]
    tag @s remove ctf.new
