scoreboard players operation #x_current temp = #x_size temp
scoreboard players operation #y_current temp = #y_size temp
scoreboard players operation #z_current temp = #z_size temp

function ./remove/loop_y:
    if score #y_current temp matches ..0:
        return 0

    scoreboard players remove #y_current temp 1

    function ./remove/loop_z:
        if score #z_current temp matches ..0:
            return 0

        fill ~ ~ ~ ~ ~ ~ air replace red_concrete
        fill ~ ~ ~ ~ ~ ~ air replace blue_concrete

        scoreboard players remove #z_current temp 1

        positioned ~ ~ ~1:
            function ./remove/loop_z

    scoreboard players operation #z_current temp = #z_size temp
    function ./remove/loop_z

    positioned ~ ~1 ~:
        function ./remove/loop_y

function ./remove/loop_y

scoreboard players reset #x_current temp
scoreboard players reset #y_current temp
scoreboard players reset #z_current temp
