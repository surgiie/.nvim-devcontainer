# nvim-devcontainer

My personal setup for quickly spinning up a [devcontainer](https://github.com/devcontainers/cli) for neovim for development.

## Prerequisites

- Docker
- [devcontainer cli](https://github.com/devcontainers/cli)
- Your neovim configuration is present in `~/.config/nvim`

## Usage

- Clone this repository to `~/.nvim-devcontainer`
- Add this to your shell configuration file (e.g. `~/.bashrc`):


```bash
source ~/.nvim-devcontainer/nvim-devcontainer
````

- Run in your project directory:


```bash
# start existing or create container and attach to it
nvim --container  # once attached can run "nvim ." to open workspace directory
# If initial create, you can install with specific stack/tools as named in ~/.nvim-devcontainer/scripts/installs:
nvim --container --php --node

# any extra arguments will be passed to the devcontainer exec command
nvim --container --remote-env EXAMPLE_BAR=foo
```

**Note** : When the `--container` option is omitted, this will run `nvim` to open neovim on the host machine.


