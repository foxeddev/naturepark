#!tag "naturepark:uninstall"

# Commands in this file will run when the data pack gets uninstalled manually by a player.

# Remove Scoreboard(s)
scoreboard objectives remove ctf
scoreboard objectives remove ctf.deaths
scoreboard objectives remove ctf.red_flag_broken
scoreboard objectives remove ctf.blue_flag_broken

# Remove Storage(s)


# Remove Team(s)

team remove ctf.red
team remove ctf.blue

# Remove Bossbar(s)
bossbar remove ctf.time
