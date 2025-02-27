# Commands in this file will run when the world loads, the data pack gets enabled or after a reload.

scoreboard objectives add {{ default_namespace }} dummy
unless score #installed {{ default_namespace }} matches 1 run function ./install
scoreboard players set #installed {{ default_namespace }} 1
