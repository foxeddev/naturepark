# Add a new location
#
# Usage: `/function sp:add {id:<id>,name:<name>}`

$summon marker ~ ~ ~ {Tags:["sp.location"],data:{sp:{id:"$(id)",name:"$(name)"}}}
