from beet import Context, FunctionTag


def beet_default(ctx: Context):
    namespaces = ctx.meta.get("project_namespaces")

    if not namespaces:
        raise ValueError("'project_namespaces' key missing in Beet meta.")

    if not ctx.data.function_tags.get("minecraft:load"):
        ctx.data.function_tags["minecraft:load"] = FunctionTag()

    if not ctx.data.function_tags.get("minecraft:tick"):
        ctx.data.function_tags["minecraft:tick"] = FunctionTag()

    for namespace in namespaces:
        ctx.data.function_tags["minecraft:load"].append(
            FunctionTag({"values": [f"{namespace}:load"]})
        )

        ctx.data.function_tags["minecraft:tick"].append(
            FunctionTag({"values": [f"{namespace}:tick"]})
        )
