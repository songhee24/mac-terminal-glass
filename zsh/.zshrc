# ~/.zshrc — cleaned during Mac setup (glass terminal + Starship)
# Old backup at ~/.zshrc.bak-precleanup

# ---------- PATH ----------
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# user-local binaries
export PATH="$HOME/.local/bin:$PATH"

# ---------- History ----------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE INC_APPEND_HISTORY

# ---------- eza (modern ls) ----------
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza -l  --icons --group-directories-first --git'
  alias la='eza -la --icons --group-directories-first --git'
  alias lt='eza --tree --level=2 --icons'
fi

# ---------- Autosuggestions ----------
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# ---------- fzf (fuzzy history / files) ----------
command -v fzf >/dev/null 2>&1 && source <(fzf --zsh) 2>/dev/null

# ---------- Prompt: Starship (Catppuccin Mocha) ----------
eval "$(starship init zsh)"

# ---------- Startup banner ----------
command -v fastfetch >/dev/null 2>&1 && fastfetch

# ---------- Syntax highlighting (MUST be last) ----------
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
