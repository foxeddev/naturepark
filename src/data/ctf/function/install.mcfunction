#!tag "naturepark:install"

# Commands in this file will run once when the data pack gets installed.

# Create Scoreboard(s)
scoreboard objectives add ctf.id dummy
scoreboard objectives add ctf.state dummy # 0: idle, 1: players hiding flag, 2: players capturing flag
scoreboard objectives add ctf.deaths deathCount

# Teams

# Red
team add ctf.red "Team Red"
team modify ctf.red prefix "Team Red | "
team modify ctf.red color red
team modify ctf.red nametagVisibility hideForOtherTeams
team modify ctf.red deathMessageVisibility always

# Blue
team add ctf.blue "Team Blue"
team modify ctf.blue prefix "Team Blue | "
team modify ctf.blue color blue
team modify ctf.blue nametagVisibility hideForOtherTeams
team modify ctf.blue deathMessageVisibility always
