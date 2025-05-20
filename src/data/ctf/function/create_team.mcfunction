$team add ctf.$(id) "Team $(color)"
$team modify ctf.$(id) prefix "Team $(color) | "
$team modify ctf.$(id) color $(color)
$team modify ctf.$(id) nametagVisibility hideForOtherTeams
$team modify ctf.$(id) deathMessageVisibility always

$scoreboard objectives add ctf.$(color)_flag_broken minecraft.mined:$(color)_banner
$scoreboard objectives add ctf.$(color)_flag_placed minecraft.used:$(color)_banner

$bossbar add ctf:$(id) "Time"
$bossbar set ctf:$(id) color $(color)
