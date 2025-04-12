# Elias' dotfiles, managed by [chezmoi](https://github.com/twpayne/chezmoi)

**insert screenshot here**

## Contents

- `brew` for most tools like chezmoi, lazygit, yazi, etc
- `.config` for my configuration files for tools like aerospace, sketchybar, etc
- `.git-config` for git configuration
- `.local/bin` for manually installed tools via executables
- `.zshrc` configuration including `.zprofile`, `.zshenv`
- and other config files for specific [tools](#tools)

## Installation

[chezmoi](https://github.com/twpayne/chezmoi) makes managing my dotfiles easy. Setup a new macOS machine in one line:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply eliasbenaddou
```

## Tools

1. **[aerospace](https://github.com/nikitabobko/AeroSpace)** – AeroSpace is an i3-like tiling window manager for macOS.

1. **[fd](https://github.com/sharkdp/fd)** – A simple, fast, and user-friendly alternative to `find`. Great for searching filenames with intuitive syntax.

1. **[yazi](https://github.com/sxyazi/yazi)** – A terminal file manager with Vim keybindings and plugin support. Supports previews (e.g., `.csv`, `.parquet`) with plugins like `duckdb.yazi`.

1. **[fzf](https://github.com/junegunn/fzf)** – A general-purpose command-line fuzzy finder. Useful for interactive search through files, Git commits, processes, and more.

1. **[lla](https://github.com/eza-community/eza)** – Wrapper for enhanced `ls` (e.g., `ls -la`), often symlinked to `eza` or `lsd`.

1. **[television](https://github.com/julienXX/television)** – A terminal file explorer like `yazi`, optimized for keyboard navigation.

1. **[duckdb](https://github.com/duckdb/duckdb)** – An in-process SQL OLAP database. Great for querying `.csv`, `.parquet`, and large datasets directly.

1. **[bat](https://github.com/sharkdp/bat)** – A better `cat` with syntax highlighting, Git integration, and line numbers.

1. **[zsh-helix-mode](https://github.com/Multirious/zsh-helix-mode)** – Bring comfort of working with Helix keybindings to your Zsh environment. This plugin attempts to implement Helix keybindings as accurately and completely as possible while respecting existing shell workflows.## Theme

i. \*\*[helix-weztern](https://github.com/quantonganh/helix-wezterm?tab=readme-ov-file) - Turning Helix into an IDE with the help of WezTerm and CLI tools.

## Theme

All tools or configurations that have themes use the Tokyo Night Storm [pallette](https://github.com/tokyo-night/tokyo-night-vscode-theme).
