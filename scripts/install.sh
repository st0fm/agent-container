#!/bin/sh

mkdir -p ~/bin
ln -sf "$(pwd)/run.sh" ~/bin/claude
ln -sf "$(pwd)/run-acp.sh" ~/bin/claude-agent-acp
chmod +x run.sh run-acp.sh
