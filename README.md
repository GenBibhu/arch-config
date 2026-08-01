<div align="center">

# Arch Config

Personal Arch Linux development configuration for a fast terminal-first workflow.

![Lua](https://img.shields.io/badge/Lua-Neovim-2C2D72?style=for-the-badge&logo=lua&logoColor=white)
![Starship](https://img.shields.io/badge/Prompt-Starship-DD0B78?style=for-the-badge&logo=starship&logoColor=white)
![Arch Linux](https://img.shields.io/badge/OS-Arch_Linux-1793D1?style=for-the-badge&logo=archlinux&logoColor=white)

</div>

---

## Overview

This repository stores a compact Arch Linux setup focused on two daily-driver tools:

- **Neovim / LazyVim** configuration for coding, Python work, terminal integration, and visual polish.
- **Starship** prompt configuration with a neon-inspired multi-line prompt and language/runtime indicators.

It is designed as a personal dotfiles snapshot that can be copied or linked into a fresh Arch environment.

## Highlights

- LazyVim bootstrap through `nvim/init.lua`
- Transparent editor background through `transparent.nvim`
- Minimap support through `codewindow.nvim`
- Python environment switching through `venv-selector.nvim`
- Pyright configuration for workspace-aware Python diagnostics
- Integrated terminal support through `toggleterm.nvim`
- Catppuccin theme with custom high-contrast syntax highlights
- Starship prompt with OS, user, host, directory, Git, Python, Conda, Node.js, and Rust modules

## Repository Structure

```text
.
|-- nvim/
|   |-- init.lua
|   |-- lazyvim.json
|   |-- lazy-lock.json
|   |-- stylua.toml
|   `-- lua/
|       |-- config/
|       `-- plugins/
`-- starship.toml
```

## Requirements

- Arch Linux or another Linux distribution
- Neovim 0.9+
- Git
- Starship
- A Nerd Font for prompt and editor icons
- Optional: Anaconda or Conda if you want the Python environment selector paths to work as configured

## Installation

Back up any existing configuration first:

```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.config/starship.toml ~/.config/starship.toml.backup
```

Copy the Neovim config:

```bash
cp -r nvim ~/.config/nvim
```

Copy the Starship config:

```bash
cp starship.toml ~/.config/starship.toml
```

Start Neovim and let LazyVim install the configured plugins:

```bash
nvim
```

## Starship Setup

Install Starship if it is not already installed:

```bash
sudo pacman -S starship
```

Enable it in your shell. For Zsh:

```bash
eval "$(starship init zsh)"
```

For Bash:

```bash
eval "$(starship init bash)"
```

## Neovim Notes

The Neovim setup is based on LazyVim and keeps custom behavior inside:

```text
nvim/lua/plugins/custom.lua
```

Notable keymaps configured by plugins:

| Keymap | Action |
| --- | --- |
| `<leader>m` | Toggle minimap |
| `<leader>vs` | Select Python virtual environment |
| `<leader>vc` | Select cached Python virtual environment |
| `<leader>vd` | Delete selected virtual environment |
| `<c-\>` | Toggle terminal |

## Customization

- Update Starship colors and segments in `starship.toml`.
- Add LazyVim plugins in `nvim/lua/plugins/custom.lua`.
- Add editor options in `nvim/lua/config/options.lua`.
- Add personal keymaps in `nvim/lua/config/keymaps.lua`.

## License

No license file is currently included. Add one before reusing or distributing this configuration outside personal use.
