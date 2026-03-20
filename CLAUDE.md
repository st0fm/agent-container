# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A minimal container wrapper for running the Claude CLI in an isolated Debian (trixie-slim) environment using Podman. The container runs as a non-root user matching the host user's UID/GID, with the host's Claude config and current project directory mounted in.

## Common Commands

**Build the container image:**
```sh
./build.sh
```

**Run Claude CLI in the container (from any project directory):**
```sh
./run.sh [claude-args...]
```

**Install as a system-wide `claude` command:**
```sh
./install.sh  # symlinks run.sh to ~/bin/claude
```

## How It Works

- `build.sh` — builds the `agent-container` image, passing host username/UID/GID as build args so the in-container user matches the host user
- `Containerfile` — installs curl, creates the matching user, installs Claude CLI via `curl -fsSL https://claude.ai/install.sh | bash`, copies `entrypoint.sh`
- `run.sh` — mounts `~/.claude` and `~/.claude.json` (credentials/config) and the current working directory (as `/<basename>`), then invokes the container
- `entrypoint.sh` — `cd`s into the mounted project directory and runs `claude` with any forwarded arguments

The mount path inside the container is `/<directory-basename-of-pwd>`, e.g. running from `/home/user/myproject` mounts it at `/myproject`.
