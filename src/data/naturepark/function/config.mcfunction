# Send message with data pack configuration options

tellraw @s [{"bold":true,"text":"{{ project_name }} Configuration Options"},{"bold":false,"text":"\n\nGames","underlined":true},{"bold":false,"clickEvent":{"action":"run_command","value":"/function ctf:config"},"text":"\n\n[CTF]"}]
