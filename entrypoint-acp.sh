#!/bin/bash
cwd="$1"
shift 1
export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"
cd "$cwd"
exec claude-agent-acp "$@"
