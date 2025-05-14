#!tag "minecraft:load"

data remove storage ctf:maps maps
data merge storage ctf:maps {
    maps: {
        snowy_settlements: {
            size: [48, 16, 48],
            distance_area: "dx=47,dy=15,dz=47",
            distance_half: "dx=23,dy=15,dz=23"
        }
    }
}
