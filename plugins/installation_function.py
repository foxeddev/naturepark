__all__ = [
    "InstallationFunctionOptions",
    "installation_function",
]


from typing import Optional

from beet import Advancement, Context, PluginOptions, configurable
from beet.core.utils import JsonDict, normalize_string


class InstallationFunctionOptions(PluginOptions):
    pack_namespace: Optional[str] = None


def beet_default(ctx: Context):
    ctx.require(installation_function)


@configurable(validator=InstallationFunctionOptions)
def installation_function(ctx: Context, opts: InstallationFunctionOptions):

    namespace = opts.pack_namespace or normalize_string(ctx.project_id)

    ctx.data.advancements[f"{namespace}:installed"].data["rewards"] = {
        "function": f"{namespace}:installed"
    }
