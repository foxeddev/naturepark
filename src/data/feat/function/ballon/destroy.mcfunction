$execute as @e[type=pig,tag=feat.ballon] if data entity @s {leash:{UUID:$(UUID)}} run function feat:ballon/destroy/nested_execute_0
