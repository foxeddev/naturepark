# 🪧 Signposts

A system to create clickable signs that teleport players to a location.

## Usage

#### Give yourself a sign:

```mcfunction
/give @p spruce_sign[block_entity_data={id:"sign",front_text:{messages:["",{"text":"<location_name>","click_event":{"action":"run_command","command":"/function sp:tp {to:\"<location_id>\"}"}},"",""]}}] 1
```

Example:

```mcfunction
/give @p spruce_sign[block_entity_data={id:"sign",front_text:{messages:["",{"text":"Spawn >","click_event":{"action":"run_command","command":"/function sp:tp {to:\"spawn\"}"}},"",""]}}] 1
```

#### Place a sign:

```mcfunction
/setblock ~ ~ ~ spruce_sign{front_text:{messages:["",{"text":"<location_name>","click_event":{"action":"run_command","command":"/function sp:tp {to:\"<location_id>\"}"}},"",""]}} replace
```

Example:

```mcfunction
/setblock ~ ~ ~ spruce_sign{front_text:{messages:["",{"text":"Spawn >","click_event":{"action":"run_command","command":"/function sp:tp {to:\"spawn\"}"}},"",""]}} replace
```

## Adding locations

```mcfunction
/function sp:add {id:<id>,name:<name>}
```
