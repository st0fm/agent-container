#!/bin/sh
[ ! -d ~/.claude ] && mkdir ~/.claude
[ ! -f ~/.claude.json ] && touch ~/.claude.json

# Mount the project at the same absolute path inside the container so that any
# cwd the ACP client (e.g. agent-shell) sends resolves to the same directory.
exec podman run -i --rm \
     --userns=keep-id \
     -v"$HOME/.claude":"$HOME/.claude":z \
     -v"$HOME/.claude.json":"$HOME/.claude.json":z \
     -v"$(pwd)":"$(pwd)":z \
     --entrypoint /entrypoint-acp.sh \
     agent-container \
     "$(pwd)" "$@"
