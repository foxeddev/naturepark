from beet import Context, FunctionTag


def beet_default(ctx: Context):
    ctx.data.function_tags["minecraft:load"] = FunctionTag(
        {"values": [f"{ctx.meta['generate_namespace']}:load"]}
    )

    ctx.data.function_tags["minecraft:tick"] = FunctionTag(
        {"values": [f"{ctx.meta['generate_namespace']}:tick"]}
    )
