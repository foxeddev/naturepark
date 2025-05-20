execute at @s with entity @s data.ctf:
    $data modify storage ctf:temp m set from storage ctf:maps maps.$(map)
    execute with storage ctf:temp m:
        $kill @e[$(distance_area),tag=!ctf.field,tag=!admin]
    data remove storage ctf:temp m
    $execute positioned ~ ~-2 ~ run function ctf:load_map {map:"$(map)/team_areas"}
    $function ctf:load_map {map:"$(map)/close"}
    $function ctf:load_map {map:"$(map)/open"}
