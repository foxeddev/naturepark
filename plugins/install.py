from beet import Context, Function


def beet_default(ctx: Context):
    namespace = ctx.meta["generate_namespace"]

    if ctx.data.functions.get(f"{namespace}:install") == None:
        ctx.generate(f"{namespace}:install", Function([]))

    if ctx.data.functions.get(f"{namespace}:uninstall") == None:
        ctx.generate(f"{namespace}:uninstall", Function([]))

    ctx.data.functions[f"{namespace}:load"].append(
        [
            f"scoreboard objectives add {namespace} dummy",
            f"execute unless score #installed {namespace} matches 1 run function ./install",
            f"execute unless score #installed {namespace} matches 1 run say Data pack installed: [{ctx.project_name}]",
            f"scoreboard players set #installed {namespace} 1",
        ]
    )

    # Remove the scoreboard objective to the uninstall function
    ctx.data.functions[f"{namespace}:uninstall"].append(
        f"scoreboard objectives remove {namespace}"
    )

    # Disable the datapack
    ctx.data.functions[f"{namespace}:uninstall"].append(
        [
            f'datapack disable "file/{ctx.project_id}_{ctx.project_version}_data_pack"',
            f'datapack disable "file/{ctx.project_id}_{ctx.project_version}_data_pack.zip"',
        ]
    )
