# Commands in this file will run once when the data pack gets installed.

# Create Scoreboard(s)
scoreboard objectives add ctf dummy
scoreboard objectives add ctf.deaths deathCount
scoreboard objectives add ctf.red_flag_broken minecraft.mined:red_banner
scoreboard objectives add ctf.blue_flag_broken minecraft.mined:blue_banner

# Create Storage(s)


# Create Team(s)

# Create red team
team add ctf.red "Team Red"
team modify ctf.red prefix "Team Red | "
team modify ctf.red color red
team modify ctf.red nametagVisibility hideForOtherTeams
team modify ctf.red deathMessageVisibility always

# Create blue team
team add ctf.blue "Team Blue"
team modify ctf.blue prefix "Team Blue | "
team modify ctf.blue color blue
team modify ctf.blue nametagVisibility hideForOtherTeams
team modify ctf.blue deathMessageVisibility always

# Create Bossbar(s)
bossbar add ctf.time "Time"
bossbar set ctf.time color green
