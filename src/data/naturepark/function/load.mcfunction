append function_tag minecraft:load {
    "values": [
        "naturepark:load"
    ]
}

# Commands in this file will run when the world loads, the data pack gets enabled or after a reload.

scoreboard objectives add naturepark dummy
unless score #installed naturepark matches 1 run function ./install
scoreboard players set #installed naturepark 1
