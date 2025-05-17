$execute store success score #placing_successful temp run place template ctf:maps/$(map)
$execute unless score #placing_successful temp matches 1 run tellraw @p {"text":"Error while placing $(map): Map file not found.","color":"red"}
scoreboard players reset #placing_successful temp
