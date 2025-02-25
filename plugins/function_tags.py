from beet import Context, FunctionTag


def beet_default(ctx: Context):
    namespace = ctx.meta["generate_namespace"]

    ctx.data.function_tags["minecraft:load"] = FunctionTag(
        {"values": [f"{namespace}:load"]}
    )

    ctx.data.function_tags["minecraft:tick"] = FunctionTag(
        {"values": [f"{namespace}:tick"]}
    )
