execute if score #show_markers util matches 1:
    scoreboard players set #toggle_markers util 0
    tellraw @s {"text":"Markers are now hidden.","color":"red"}
execute unless score #show_markers util matches 1:
    scoreboard players set #toggle_markers util 1
    tellraw @s {"text":"Markers are now shown.","color":"green"}
scoreboard players operation #show_markers util = #toggle_markers util
