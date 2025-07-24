at @s:
    summon pig ~ ~5 ~ {Silent:1b,Invulnerable:1b,DeathLootTable:"minecraft:empty",PersistenceRequired:1b,Tags:["bln.pig","bln.new_pig"],Passengers:[{id:"minecraft:block_display",Tags:["bln.display"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,0f,-0.5f],scale:[1f,1f,1f]},block_state:{Name:"unset"}}],active_effects:[{id:"minecraft:levitation",amplifier:1,duration:-1,show_particles:0b},{id:"minecraft:invisibility",amplifier:1,duration:-1,show_particles:0b}],attributes:[{id:"minecraft:scale",base:0}]}
    data modify entity @e[type=pig,tag=bln.new_pig,limit=1] leash.UUID set from entity @s UUID
    tag @e[type=pig,tag=bln.new_pig] remove bln.new_pig
