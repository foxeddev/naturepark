# Uninstalls this datapack
#
# Called by: Player

# Remove Scoreboard(s)
scoreboard objectives remove {{ generate_namespace }}

# Remove Storage(s)

# Disable the datapack
datapack disable "file/{{ project_id }}_{{ project_version }}_data_pack"
datapack disable "file/{{ project_id }}_{{ project_version }}_data_pack.zip"
