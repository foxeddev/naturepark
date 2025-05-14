kill @e[type=marker,tag=ctf.field,distance=..0.5]
$summon marker ~ ~ ~ {Tags:["ctf.field","ctf.new"],data:{ctf:{map:$(id)}}}
execute as @e[type=marker,tag=ctf.new]:
    function ./reset_field
    tag @s remove ctf.new
