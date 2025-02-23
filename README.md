# nvim-devcontainer

My personal setup for running neovim in docker container for local development.

## Prerequisites

- Docker
- Your neovim configuration is present in `~/.config/nvim`

## Usage

- Clone this repository to `~/.nvim-devcontainer`
- Add this to your shell configuration file (e.g. `~/.bashrc`):


```bash
source ~/.nvim-devcontainer/nvim-devcontainer
````

- Run on desired workspace/directory

```bash
nvim --container /home/example/project # when omitting the path, it will use the current working directory

# You install with specific stack/tools as named in ~/.nvim-devcontainer/scripts/installs:
nvim --container --php --node

# any extra arguments will be passed to the devcontainer exec command
nvim --container --env EXAMPLE_BAR=foo
```

**Note** : When the `--container` option is omitted, this will run `nvim` to open neovim on the host machine.


