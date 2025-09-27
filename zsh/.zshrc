# set starship theme
eval "$(starship init zsh)"

# Activate syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Disable underline
(( ${+ZSH_HIGHLIGHTI_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Activate autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Local ENV
export DEV_ADOPTED_ENV=DEVELOPER_PC

# ----- Bat (better cat) -----
#export BAT_THEME=tokyonight_night

# ---- Eza (better ls) -----
export EZA_CONFIG_DIR="$HOME/.config/eza/"
alias ls="eza --all --icons=always"

# Alias
alias l='ls -al'
alias k=kubectl
alias h=helm
alias python=python3
alias pip=pip3

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/heeyong/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# add krew path
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# kube-ps1 plugin
#source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
#PS1='$(kube_ps1)'$PS1

# cluster.local kubernetes 
export KUBECONFIG=$HOME/.kube/config:$HOME/dev/kubespray/inventory/mycluster/admin.conf
