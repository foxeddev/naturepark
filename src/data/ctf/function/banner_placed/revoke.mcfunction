advancement revoke @s only ctf:banner_placed

if entity @s[tag=ctf.player]:
    say Advancement triggered!
    tag @s add ctf.current_player
    as @e[type=marker,tag=ctf.field] if score @s ctf.id = @a[tag=ctf.current_player,limit=1] ctf.id:
        tag @s add ctf.current_field
    tag @s remove ctf.current_player

    if score @e[type=marker,tag=ctf.current_field,limit=1] ctf.state matches 1:
        say Flag placed!
        if entity @s[tag=ctf.team_red]:
            data merge entity @e[type=marker,tag=ctf.current_field,limit=1] {data:{ctf:{red_flag_placed:1b}}}
        if entity @s[tag=ctf.team_blue]:
            data merge entity @e[type=marker,tag=ctf.current_field,limit=1] {data:{ctf:{blue_flag_placed:1b}}}
        as @e[type=marker,tag=ctf.current_field] if data entity @s {data:{ctf:{red_flag_placed:1b,blue_flag_placed:1b}}}:
            say Both flags placed! Starting game...
            tag @s remove ctf.current_field
            function ../play
