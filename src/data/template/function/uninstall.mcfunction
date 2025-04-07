# Commands in this file will run when the data pack gets uninstalled manually by a player.

# Remove Scoreboard(s)

# Remove Storage(s)

scoreboard objectives remove template
tellraw @a "Data pack uninstalled!"
datapack disable "file/{{ project_id }}_{{ project_version }}_data_pack"
datapack disable "file/{{ project_id }}_{{ project_version }}_data_pack.zip"
