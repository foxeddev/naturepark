from beet import Context, Function


def beet_default(ctx: Context):
    if ctx.data.functions.get(f"{ctx.meta['generate_namespace']}:install") == None:
        ctx.generate(f"{ctx.meta['generate_namespace']}:install", Function([]))

    if ctx.data.functions.get(f"{ctx.meta['generate_namespace']}:uninstall") == None:
        ctx.generate(f"{ctx.meta['generate_namespace']}:uninstall", Function([]))

    ctx.data.functions[f"{ctx.meta['generate_namespace']}:load"].append(
        [
            f"scoreboard objectives add {ctx.meta['generate_namespace']} dummy",
            f"execute unless score #installed {ctx.meta['generate_namespace']} matches 1 run function ./install",
            f"execute unless score #installed {ctx.meta['generate_namespace']} matches 1 run say Data pack installed: [{ctx.project_name}]",
            f"scoreboard players set #installed {ctx.meta['generate_namespace']} 1",
        ]
    )

    # Remove the scoreboard objective to the uninstall function
    ctx.data.functions[f"{ctx.meta['generate_namespace']}:uninstall"].append(
        f"scoreboard objectives remove {ctx.meta['generate_namespace']}"
    )

    # Disable the datapack
    ctx.data.functions[f"{ctx.meta['generate_namespace']}:uninstall"].append(
        [
            f'datapack disable "file/{ctx.project_id}_{ctx.project_version}_data_pack"',
            f'datapack disable "file/{ctx.project_id}_{ctx.project_version}_data_pack.zip"',
        ]
    )
