#!/bin/sh
share=`basename $(pwd)`

[ ! -d ~/.claude ] && mkdir ~/.claude
[ ! -f ~/.claude.json ] && touch ~/.claude.json

podman run -it --rm \
     --userns=keep-id \
     -v"$HOME/.claude":"$HOME/.claude" \
     -v"$HOME/git/dotfiles/claude/settings.json":"$HOME/.claude/settings.json" \
     -v"$HOME/.claude.json":"$HOME/.claude.json" \
     -v"$(pwd)":/"$share" \
     agent-container \
     "$share" --dangerously-skip-permissions $@
