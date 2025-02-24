from beet import Context, Function, TextFileContent


def beet_default(ctx: Context):
    ctx.data[f"{ctx.meta['generate_namespace']}:load"] = Function(
        [
            f"scoreboard objectives add {ctx.meta['generate_namespace']} dummy",
            f"execute unless score #installed {ctx.meta['generate_namespace']} matches 1 run function ./install",
            f"execute unless score #installed {ctx.meta['generate_namespace']} matches 1 run say Data pack installed: [{ctx.project_name}]",
            f"scoreboard players set #installed {ctx.meta['generate_namespace']} 1",
        ],
        tags=["minecraft:load"],
    )
