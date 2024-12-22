eval "$(starship init zsh)"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting 
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

bindkey '^p' history-search-backward 
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase 
setopt appendhistory
setopt sharehistory 
setopt hist_ignore_space 
setopt hist_ignore_all_dups 
setopt hist_save_no_dups 
setopt hist_ignore_dups 
setopt hist_find_no_dups

# Shell integrations
eval "$(fzf --zsh)"

# Load completions
autoload -U compinit && compinit

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
#zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# Aliases
alias ls='ls --color'

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to swag
export PATH="/Users/ashutoshdwivedi/go/bin:$PATH"

# Path to nvim 0.10.0
export PATH="$HOME/Downloads/nvim-macos-arm64/bin:$PATH"

# Path to Python
export PATH="/Users/ashutoshdwivedi/Library/Python/3.9/bin:$PATH"

# Path for mongosync
export PATH="/Users/ashutoshdwivedi/Downloads/mongosync-macos-arm-arm64-1.7.1/bin:$PATH"

# Path to local bin
export PATH="/usr/local/bin:$PATH"

# Path to cloud sql proxy
export PATH="/Users/ashutoshdwivedi:$PATH"

# Path to wrk load testing tool
export PATH="/Users/ashutoshdwivedi/Desktop/lab/wrk:$PATH"

# Path to go
export PATH="/opt/homebrew/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# My custom aliases
alias cls="clear"
alias pdb="cloud-sql-proxy aftershoot-co:us-central1:editing-uploader -p 2345"
alias sdb="cloud-sql-proxy aftershoot-stage:us-central1:aftershoot-stage-db -p 6969"
alias ddb="cloud-sql-proxy aftershoot-co:us-central1:profile-manager-test -p 1234"
alias sdbinter="pgcli --host 127.0.0.1 --port 6969 --username postgres --password --auto-vertical-output"
alias pdbinter="pgcli --host 127.0.0.1 --port 2345 --username postgres --password --auto-vertical-output"
alias ddbinter="pgcli --host 127.0.0.1 --port 1234 --username postgres --password --auto-vertical-output"
alias plog="gcloud beta run services logs tail --project=aftershoot-co --region=us-central1"
alias slog="gcloud beta run services logs tail --project=aftershoot-stage --region=us-central1"
alias jbuild="cd ./secret/jarvis && cargo build --release && cd - && mv ./secret/jarvis/target/release/jarvis ."
function float-tmux-script() {
    ~/float-tmux.sh
}
zle -N float-tmux-script
bindkey '^\' float-tmux-script

plugins=(git)

source $ZSH/oh-my-zsh.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ashutoshdwivedi/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ashutoshdwivedi/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ashutoshdwivedi/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ashutoshdwivedi/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# pnpm
export PNPM_HOME="/Users/ashutoshdwivedi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ashutoshdwivedi/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ashutoshdwivedi/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ashutoshdwivedi/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ashutoshdwivedi/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=/Users/ashutoshdwivedi/miniconda3/bin:/Users/ashutoshdwivedi/miniconda3/condabin:/Users/ashutoshdwivedi/Library/pnpm:/Users/ashutoshdwivedi/Downloads/google-cloud-sdk/bin:/Users/ashutoshdwivedi/.nvm/versions/node/v20.11.1/bin:/Users/ashutoshdwivedi/Desktop/lab/wrk:/Users/ashutoshdwivedi:/Users/ashutoshdwivedi/Downloads/warp:/usr/local/bin:/Users/ashutoshdwivedi/Downloads/mongosync-macos-arm-arm64-1.7.1/bin:/Users/ashutoshdwivedi/Library/Python/3.9/bin:/Users/ashutoshdwivedi/Downloads/nvim-macos-arm64/bin:/Users/ashutoshdwivedi/go/bin:/Users/ashutoshdwivedi/.local/share/zinit/polaris/bin:/Users/ashutoshdwivedi/.cargo/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/Apple/usr/bin:/usr/local/go/bin:/Applications/kitty.app/Contents/MacOS:/opt/homebrew/bin
