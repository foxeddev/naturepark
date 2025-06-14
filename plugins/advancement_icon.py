__all__ = [
    "AdvancementIconOptions",
    "advancement_icon",
]


from typing import Optional

from beet import Context, ItemModel, Model, Texture, PluginOptions, configurable
from beet.core.utils import normalize_string


class AdvancementIconOptions(PluginOptions):
    pack_namespace: Optional[str] = None
    texture_source: Optional[str] = "src/pack.png"


def beet_default(ctx: Context):
    ctx.require(advancement_icon)


@configurable(validator=AdvancementIconOptions)
def advancement_icon(ctx: Context, opts: AdvancementIconOptions):

    namespace = opts.pack_namespace or normalize_string(ctx.project_id)

    if "installation_advancement" not in ctx.meta:
        ctx.meta["installation_advancement"] = {}

    ctx.meta["installation_advancement"]["icon"] = create_icon_meta(namespace)
    ctx.assets[f"{namespace}:icon"] = create_item_model(namespace)
    ctx.assets[f"{namespace}:item/icon"] = create_model(namespace)
    ctx.assets[f"{namespace}:item/icon"] = create_texture(
        opts.texture_source or "src/pack.png"
    )


def create_icon_meta(namespace: str):
    return dict(
        {
            "id": "minecraft:paper",
            "components": {"item_model": f"{namespace}:icon"},
        }
    )


def create_item_model(namespace: str):
    return ItemModel(
        {
            "model": {
                "type": "minecraft:model",
                "model": f"{namespace}:item/icon",
            }
        }
    )


def create_model(namespace: str):
    return Model(
        {
            "parent": "item/generated",
            "textures": {"layer0": f"{namespace}:item/icon"},
        }
    )


def create_texture(texture_source: str):
    return Texture(source_path=texture_source)
