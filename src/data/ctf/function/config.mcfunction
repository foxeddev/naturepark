# Send message with data pack configuration options

tellraw @s [{"bold":true,"text":"{{ project_name }} Configuration Options | "},{"color":"dark_green","text":"CTF"},{"bold":false,"clickEvent":{"action":"run_command","value":"/function ctf:config/interface"},"hoverEvent":{"action":"show_text","value":[{"text":"[Warning] ","color":"red"},{"text":"Your inventory will be cleared!","color":"white"}]},"text":"\n\nSet up playing field"}]
