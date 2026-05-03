# Elias' dotfiles, managed by [chezmoi](https://github.com/twpayne/chezmoi)

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

1. **[fd](https://github.com/sharkdp/fd)** – A simple, fast, and user-friendly alternative to `find`. Great for searching filenames with intuitive syntax.

1. **[fzf](https://github.com/junegunn/fzf)** – A general-purpose command-line fuzzy finder. Useful for interactive search through files, Git commits, processes, and more.

1. **[lla](https://github.com/eza-community/eza)** – Wrapper for enhanced `ls` (e.g., `ls -la`), often symlinked to `eza` or `lsd`.

## Theme

All tools or configurations that have themes use the Tokyo Night Storm [pallette](https://github.com/tokyo-night/tokyo-night-vscode-theme).
