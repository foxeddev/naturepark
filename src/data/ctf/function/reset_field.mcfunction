execute at @s with entity @s data.ctf:
    $data modify storage ctf:temp m set from storage ctf:maps maps.$(map)
    execute with storage ctf:temp m:
        $kill @e[$(distance_area),tag=!ctf.field]
    $execute store success score #placing_successful temp run place template ctf:maps/$(map)/open
    execute unless score #placing_successful temp matches 1 run tellraw @p {"text":"Error while placing map: Map file not found.","color":"red"}
    scoreboard players reset #placing_successful temp
    data remove storage ctf:temp m
