eval "$(keychain add --eval --immediate ~/.ssh/archian-2026-01-21)"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Pure prompt, gruvbox colors (match ghostty palette)
zstyle :prompt:pure:path color '#83a598'
zstyle :prompt:pure:git:branch color '#928374'
zstyle :prompt:pure:git:dirty color '#d79921'
zstyle :prompt:pure:git:arrow color '#8ec07c'
zstyle :prompt:pure:git:stash color '#8ec07c'
zstyle :prompt:pure:git:action color '#d3869b'
zstyle :prompt:pure:execution_time color '#fabd2f'
zstyle :prompt:pure:host color '#a89984'
zstyle :prompt:pure:user color '#a89984'
zstyle :prompt:pure:user:root color '#fb4934'
zstyle :prompt:pure:virtualenv color '#928374'
zstyle :prompt:pure:prompt:success color '#b8bb26'
zstyle :prompt:pure:prompt:error color '#fb4934'
zstyle :prompt:pure:prompt:continuation color '#928374'

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ ! -d "$TPM_DIR" ]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR" 2> /dev/null
fi

export EDITOR=nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.local/bin:$PATH"

# Add Go to PATH
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

alias vim='nvim'
alias p='pnpm'
alias blastoff='~/scripts/tmux-home.sh && ~/scripts/tmux-website.sh && ~/scripts/tmux-dotfiles.sh && ~/scripts/tmux-tui-golf.sh && tmux a -t home'

# Open buffer line in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

bindkey "^P" up-line-or-history
bindkey "^N" down-line-or-history

# loads zsh completions
autoload -Uz compinit && compinit

eval "$(mise activate zsh)"

# pnpm
export PNPM_HOME="/home/ian/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
