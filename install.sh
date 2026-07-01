#!/usr/bin/env bash
# mac-terminal-glass installer — installs deps via Homebrew and symlinks configs.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required: https://brew.sh" >&2
  exit 1
fi

echo "==> Installing apps & fonts"
brew install --cask ghostty font-jetbrains-mono-nerd-font

echo "==> Installing CLI tools"
brew install starship eza fzf fastfetch zsh-autosuggestions zsh-syntax-highlighting

echo "==> Linking configs (existing files are backed up as *.bak)"
mkdir -p "$HOME/.config/ghostty"
link() { # $1 = source in repo, $2 = destination
  [ -e "$2" ] && [ ! -L "$2" ] && mv "$2" "$2.bak" && echo "   backed up $2 -> $2.bak"
  ln -sf "$1" "$2" && echo "   linked $2"
}
link "$REPO/config/ghostty/config"        "$HOME/.config/ghostty/config"
link "$REPO/config/starship/starship.toml" "$HOME/.config/starship.toml"
link "$REPO/zsh/.zshrc"                    "$HOME/.zshrc"

echo "==> Done. Open Ghostty to enjoy the glass. 🧊"
