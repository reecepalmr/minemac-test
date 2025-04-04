#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd ${DIR}/../minerl/MCP-Reborn

# determine patch to apply
if [[ "$1" == "--mac" ]] || [[ "$(uname)" == "Darwin" ]]; then
    patch -s -p 1 -i ${DIR}/diffs/mcp_patch2.diff
else
    patch -s -p 1 -i ${DIR}/diffs/mcp_patch.diff
fi

# Copy cursors over
cp -r ${DIR}/cursors ./src/main/resources

# Ensure all scripts are runnable
chmod +x *