#!/bin/sh
share=`basename $(pwd)`

[ ! -d ~/.claude ] && mkdir ~/.claude
[ ! -f ~/.claude.json ] && touch ~/.claude.json

podman run -it --rm \
     --userns=keep-id \
     -v"$HOME/.claude":"$HOME/.claude":z \
     -v"$HOME/.claude.json":"$HOME/.claude.json":z \
     -v"$(pwd)":/"$share":z \
     agent-container \
     "$share" --dangerously-skip-permissions $@
