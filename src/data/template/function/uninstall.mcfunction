# Commands in this file will run when the data pack gets uninstalled manually by a player.

function #template:uninstall

scoreboard objectives remove template
tellraw @a "Data pack uninstalled!"
datapack disable "file/{{ project_id }}_{{ project_version }}_data_pack"
datapack disable "file/{{ project_id }}_{{ project_version }}_data_pack.zip"
