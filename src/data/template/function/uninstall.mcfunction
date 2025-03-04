# Commands in this file will run when the data pack gets uninstalled manually by a player.

# Remove Scoreboard(s)

# Remove Storage(s)

scoreboard objectives remove {{ default_namespace }}
function msg/info {msg:"Data pack uninstalled!"}
datapack disable "file/{ctx.project_id}_{ctx.project_version}_data_pack"
datapack disable "file/{ctx.project_id}_{ctx.project_version}_data_pack.zip"
