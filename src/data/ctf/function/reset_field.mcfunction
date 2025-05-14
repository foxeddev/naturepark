execute at @s with entity @s data.ctf:
    $data modify storage ctf:temp m set from storage ctf:maps maps.$(map)
    execute with storage ctf:temp m:
        $kill @e[$(distance_area),tag=!ctf.field]
    data remove storage ctf:temp m
    $function ctf:load_map {map:"$(map)/open"}
