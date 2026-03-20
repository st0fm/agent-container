#!/bin/bash
share="$1"
shift 1
export PATH=$PATH:$HOME/.local/bin
cd "/$share"
/$HOME/.local/bin/claude $@
