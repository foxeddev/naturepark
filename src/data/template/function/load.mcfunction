# Commands in this file will run when the world loads, the data pack gets enabled or after a reload.

# Install the data pack if it is not already installed
scoreboard objectives add {{ generate_namespace }} dummy
execute \
  unless score #installed {{ generate_namespace }} matches 1 \
  run function ./install
execute \
  unless score #installed {{ generate_namespace }} matches 1 \
  run say Data pack installed
scoreboard players set #installed {{ generate_namespace }} 1
