execute if score #show_markers tool matches 1:
    scoreboard players set #toggle_markers tool 0
    tellraw @s {"text":"Markers are now hidden.","color":"red"}
execute unless score #show_markers tool matches 1:
    scoreboard players set #toggle_markers tool 1
    tellraw @s {"text":"Markers are now shown.","color":"green"}
scoreboard players operation #show_markers tool = #toggle_markers tool
