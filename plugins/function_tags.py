import os
from pathlib import PosixPath
from typing import Optional

from beet import Context, FunctionTag, PluginOptions, configurable


class FunctionTagOptions(PluginOptions):
    project_namespaces: Optional[list[str]] = None


def beet_default(ctx: Context):
    ctx.require(function_tags)


@configurable(validator=FunctionTagOptions)
def function_tags(ctx: Context, opts: FunctionTagOptions):
    namespaces = opts.project_namespaces or find_namespaces(
        os.path.join(ctx.directory, "src/data")
    )

    for namespace in namespaces:
        ctx.data.function_tags[f"{namespace}:load"] = create_load_tag(namespace)
        ctx.data.function_tags[f"{namespace}:tick"] = create_tick_tag(namespace)


def find_namespaces(directory: PosixPath):
    for item in os.listdir(directory):
        if os.path.isdir(os.path.join(directory, item)):
            yield item


def create_load_tag(namespace: str):
    return FunctionTag({"values": [f"{namespace}:load"]})


def create_tick_tag(namespace: str):
    return FunctionTag({"values": [f"{namespace}:tick"]})
