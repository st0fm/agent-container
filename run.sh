#!/bin/sh
share=`basename $(pwd)`

sudo podman run -it --rm \
     -v"$HOME/.claude":"$HOME/.claude" \
     -v"$HOME/.claude.json":"$HOME/.claude.json" \
     -v"$(pwd)":/"$share" \
     agent-container \
     "$share" $@
