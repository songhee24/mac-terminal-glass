# mac-terminal-glass 🧊

<img width="1440" height="900" alt="Screenshot 2026-07-03 at 21 11 58" src="https://github.com/user-attachments/assets/218af665-8589-47e4-af2e-746d6274b20a" />


Glassmorphism terminal setup for macOS — the counterpart to
[windows-terminal-glass](https://github.com/songhee24/windows-terminal-glass).

Frosted-glass **Ghostty** + **Catppuccin Mocha** + **JetBrainsMono Nerd Font** +
a git-aware **Starship** prompt, with `eza`, `fzf`, autosuggestions, syntax
highlighting, and a `fastfetch` banner.

## Stack

| Piece            | Tool                                    |
| ---------------- | --------------------------------------- |
| Terminal         | [Ghostty](https://ghostty.org) (opacity `0.82` + blur `20`) |
| Color scheme     | Catppuccin Mocha (Ghostty built-in)     |
| Font             | JetBrainsMono Nerd Font Mono            |
| Prompt           | [Starship](https://starship.rs) — Catppuccin Powerline |
| `ls` replacement | [eza](https://eza.rocks) (icons + git)  |
| Fuzzy finder     | [fzf](https://github.com/junegunn/fzf)  |
| Suggestions      | zsh-autosuggestions + zsh-syntax-highlighting |
| System banner    | [fastfetch](https://github.com/fastfetch-cli/fastfetch) |

## Install

Requires [Homebrew](https://brew.sh).

```sh
git clone https://github.com/songhee24/mac-terminal-glass.git
cd mac-terminal-glass
./install.sh
```

The script installs everything via Homebrew and symlinks the configs into place.
Then open **Ghostty** and you're done.

## Manual install

```sh
# apps + tools
brew install --cask ghostty font-jetbrains-mono-nerd-font
brew install starship eza fzf fastfetch zsh-autosuggestions zsh-syntax-highlighting

# link configs
mkdir -p ~/.config/ghostty
ln -sf "$PWD/config/ghostty/config"       ~/.config/ghostty/config
ln -sf "$PWD/config/starship/starship.toml" ~/.config/starship.toml
ln -sf "$PWD/zsh/.zshrc"                    ~/.zshrc
```

## Tuning the glass

Edit `config/ghostty/config`:

- `background-opacity` — lower = more see-through (try `0.75`).
- `background-blur-radius` — higher = frostier.
- Reload in Ghostty with **⌘⇧,**.

## Files

```
config/ghostty/config        # Ghostty appearance (glass, font, cursor, padding)
config/starship/starship.toml # Starship prompt (Catppuccin Powerline)
zsh/.zshrc                    # PATH, history, tool init, aliases
install.sh                    # installs deps + symlinks configs
```
