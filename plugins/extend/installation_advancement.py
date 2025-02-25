from beet import Context, ItemModel, Model, Texture
from PIL import Image


def pack_logo(ctx: Context):
    namespace = ctx.meta["generate_namespace"]

    if "installation_advancement" not in ctx.meta:
        ctx.meta["installation_advancement"] = {}

    ctx.meta["installation_advancement"]["icon"] = {
        "id": "minecraft:paper",
        "components": {"item_model": f"{namespace}:logo"},
    }

    ctx.assets[f"{namespace}:logo"] = ItemModel(
        {
            "model": {
                "type": "minecraft:model",
                "model": f"{namespace}:item/logo",
            }
        }
    )

    ctx.assets[f"{namespace}:item/logo"] = Model(
        {
            "parent": "item/generated",
            "textures": {"layer0": f"{namespace}:item/logo"},
        }
    )

    ctx.assets[f"{namespace}:item/logo"] = Texture(source_path="src/pack.png")
