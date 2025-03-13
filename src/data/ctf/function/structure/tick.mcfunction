execute as @e[type=item_frame,tag=ctf.new_structure_interface] at @s:
    kill @e[tag=ctf.structure_interface]
    tag @s remove ctf.new_structure_interface
    tag @s add ctf.structure_interface
    summon interaction ~ ~ ~ {response:1b,Tags:["ctf.structure_interface"]}
    ride @e[type=interaction,tag=ctf.structure_interface,limit=1] mount @s
