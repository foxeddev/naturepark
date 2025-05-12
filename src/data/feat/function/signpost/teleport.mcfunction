data remove storage feat:signpost current
$data modify storage feat:signpost current set from storage feat:signpost locations."$(to)"
execute with storage ./ current:
    $tp @s $(string)
    advancement grant @s only ../use_signpost_teleport
    $title @s actionbar {"text":"Teleported to: $(name)","color":"green"}

execute at @s:
    playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 0.5 1
    particle dust{color:[0.000,1.000,0.500],scale:1} ~ ~1.5 ~ 0.1 0.1 0.1 0 64 force @s
