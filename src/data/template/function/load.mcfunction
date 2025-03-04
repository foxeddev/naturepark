# Commands in this file will run when the world loads, the data pack gets enabled or after a reload.

scoreboard objectives add template dummy
unless score #installed template matches 1 run function ./install
scoreboard players set #installed template 1
