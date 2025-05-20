#!tag "naturepark:install"

# Commands in this file will run once when the data pack gets installed.

# Create Scoreboard(s)
scoreboard objectives add ctf dummy
scoreboard objectives add ctf.id dummy
scoreboard objectives add ctf.state dummy # 0: idle, 1: players hiding flag, 2: players capturing flag
scoreboard objectives add ctf.deaths deathCount
