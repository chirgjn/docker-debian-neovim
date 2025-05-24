# Agent Guidelines

## Build Commands
- Build Docker image: `./build`
- No tests or linting available (Docker-only project)

## Project Structure
- Simple Docker build project for creating Neovim in a minimal container
- [`build`](file:///Users/chiragjain/projects/docker-debian-neovim/build): Bash script to build Docker image
- [`Dockerfile`](file:///Users/chiragjain/projects/docker-debian-neovim/Dockerfile): Multi-stage build (builder + scratch final image)

## Code Style
- Bash scripts: Use `#!/usr/bin/env bash` shebang
- Docker: Multi-stage builds preferred, use scratch for minimal final images
- Use ARG for configurable build parameters (e.g., NEOVIM_VERSION)
- Group related RUN commands for layer efficiency
- Use specific version tags rather than latest

## Docker Best Practices
- Pin specific versions (current: Neovim v0.10.1)
- Minimize final image size with scratch base
- Use `--depth 1` for git clones to reduce build time
- Set WORKDIR explicitly for build steps
