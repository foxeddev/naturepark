as @n[type=marker,tag=ctf.field] at @s with entity @s data.ctf:
    # To test if structure exists
    $function ctf:load_map {map:"$(map)/close"}

    $data modify storage ctf:temp m set from storage ctf:maps maps.$(map)
    with storage ctf:temp m:
        $kill @e[$(distance_area),tag=!ctf.field,tag=!admin]
    data remove storage ctf:temp m

    $execute positioned ~ ~-2 ~ run function ctf:load_map {map:"$(map)/team_areas"}
    $function ctf:load_map {map:"$(map)/open"}

    # Reset data values

    data remove entity @s data.ctf.red_flag_placed
    data remove entity @s data.ctf.blue_flag_placed
