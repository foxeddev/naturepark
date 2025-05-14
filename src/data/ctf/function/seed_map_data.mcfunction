#!tag "minecraft:load"

data remove storage ctf:maps maps
data merge storage ctf:maps {
    maps: {
        snowy_settlement: {
            size: [48, 16, 48],
            distance_area: "dx=48,dy=16,dz=48",
            distance_half: "dx=24,dy=16,dz=24"
        }
    }
}
