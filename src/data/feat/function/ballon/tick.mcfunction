execute as @e[type=interaction,tag=feat.ballon] if data entity @s attack on vehicle:
    execute on passengers run kill
    kill
