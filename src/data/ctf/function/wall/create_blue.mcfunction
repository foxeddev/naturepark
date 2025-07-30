scoreboard players operation #x_current temp = #x_size temp
scoreboard players operation #y_current temp = #y_size temp
scoreboard players operation #z_current temp = #z_size temp

function ./create_blue/loop_y:
    if score #y_current temp matches ..0:
        return 0

    scoreboard players remove #y_current temp 1

    function ./create_blue/loop_z:
        if score #z_current temp matches ..0:
            return 0

        setblock ~ ~ ~ blue_concrete keep
        particle block{block_state:"minecraft:blue_concrete"} ~ ~ ~ 1 1 1 1 8 normal

        scoreboard players remove #z_current temp 1

        positioned ~ ~ ~1:
            function ./create_blue/loop_z

    scoreboard players operation #z_current temp = #z_size temp
    function ./create_blue/loop_z

    positioned ~ ~1 ~:
        function ./create_blue/loop_y

function ./create_blue/loop_y

scoreboard players reset #x_current temp
scoreboard players reset #y_current temp
scoreboard players reset #z_current temp
