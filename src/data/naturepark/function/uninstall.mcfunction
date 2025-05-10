#!tag "naturepark:uninstall"

# Commands in this file will run when the data pack gets uninstalled manually by a player.

scoreboard objectives remove naturepark
tellraw @a "Data pack uninstalled: [Nature Park]"
datapack disable "file/{{ project_id }}_{{ project_version }}_data_pack"
datapack disable "file/{{ project_id }}_{{ project_version }}_data_pack.zip"
