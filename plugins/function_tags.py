from beet import Context, FunctionTag


def beet_default(ctx: Context):
    namespaces = ctx.meta.get("project_namespaces")

    if not namespaces:
        raise ValueError("'project_namespaces' key missing in Beet meta.")

    for namespace in namespaces:
        ctx.data.function_tags[f"{namespace}:load"] = FunctionTag(
            {"values": [f"{namespace}:load"]}
        )

        ctx.data.function_tags[f"{namespace}:tick"] = FunctionTag(
            {"values": [f"{namespace}:tick"]}
        )
