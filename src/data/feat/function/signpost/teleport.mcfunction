data remove storage feat:signpost current
$data modify storage feat:signpost current set from storage feat:signpost locations.$(to)
execute with storage ./ current:
    $tp @s $(string)
    advancement grant @s only ./use_signpost_teleport
