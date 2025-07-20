# Usage: `/function sp:tp {to:<location_id>}`

tag @s add sp.current_player

$execute as @e[type=marker,tag=sp.location] if data entity @s {data:{sp:{id:"$(to)"}}} run tag @s add sp.current_marker

execute as @e[type=marker,tag=sp.current_marker,limit=1]:
    tp @a[tag=sp.current_player] @s
    data modify storage sp:temp name set from entity @s data.sp.name
    title @a[tag=sp.current_player] actionbar [{"color":"green","text":"Teleported to: "},{"storage":"sp:temp","nbt":"name"}]
    data remove storage sp:temp name
    tag @s remove sp.current_marker

at @s:
    advancement grant @s only ../use_signpost_teleport
    playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 0.5 1
    particle dust{color:[0.000,1.000,0.500],scale:1} ~ ~1.5 ~ 0.1 0.1 0.1 0 64 force @s

tag @s remove sp.current_player
