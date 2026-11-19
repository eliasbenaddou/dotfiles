# Elias' dotfiles, managed by [chezmoi](https://github.com/twpayne/chezmoi)

- `.config/zsh/` – zsh split into small files (environment, completions, prompt, fzf, history, aliases, zoxide), sourced in order by `.zshrc`
- `.zshenv` / `.zprofile` – locale, PATH, Homebrew
- `.gitconfig` + `.config/git/ignore` – git configuration and global ignore
- `.config/brew/Brewfile` – everything installed with Homebrew (`brew bundle dump`)
- `.config/wezterm/` – terminal
- `.config/starship/` – prompt
- `.config/lla/` – `lla` file lister

## Installation

[chezmoi](https://github.com/twpayne/chezmoi) makes managing my dotfiles easy. Setup a new macOS machine in one line:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply eliasbenaddou
```

Then install the tools:

```sh
brew bundle --file ~/.config/brew/Brewfile
```

## Day to day

After editing a managed file in `~`, sync it back into the source and commit:

```sh
chezmoi re-add ~/.zshrc
chezmoi git -- commit -am "..."
```

## Tools

- **[fd](https://github.com/sharkdp/fd)** – fast `find` replacement, used by fzf
- **[fzf](https://github.com/junegunn/fzf)** – fuzzy finder (`Ctrl-T` files, `Ctrl-R` history, `Alt-C` directories)
- **[eza](https://github.com/eza-community/eza)** – `ls` replacement (`ls`, `l`)
- **[zoxide](https://github.com/ajeetdsouza/zoxide)** – smarter `cd`
- **[starship](https://starship.rs)** – prompt
- **[delta](https://github.com/dandavison/delta)** – git diff pager
- **[uv](https://github.com/astral-sh/uv)** – Python tooling; `~/.local/bin` holds its installed tools
- Editor is VS Code (`EDITOR="code --wait"`)

## Theme

All tools or configurations that have themes use the Tokyo Night Storm [palette](https://github.com/tokyo-night/tokyo-night-vscode-theme).
