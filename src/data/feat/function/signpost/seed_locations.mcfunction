#!tag "minecraft:load"

data remove storage feat:signpost locations
data merge storage ./ {
    "locations": {
        "origin": {"name": "World Origin", "array": [0, 64, 0], "string": "0 64 0"},
        "headquarters": {"name": "Headquarters", "array": [-101, 71, -189], "string": "-101 71 -189"},
        "ctf.snowy_settlements": {"name": "Snowy Settlements | CTF Map", "array": [142, 68, -370], "string": "142 68 -370"},
    }
}
