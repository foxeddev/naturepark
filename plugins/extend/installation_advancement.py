from beet import Context


def pack_logo(ctx: Context):
    if "installation_advancement" not in ctx.meta:
        ctx.meta["installation_advancement"] = {}

    ctx.meta["installation_advancement"]["icon"] = {
        "id": "minecraft:paper",
        "components": {"item_model": ctx.project_id + ":logo"},
    }
