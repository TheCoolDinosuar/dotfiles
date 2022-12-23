# Setup fzf
# ---------
if [[ ! "$PATH" == */home/alduan/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/alduan/.fzf/bin"
fi

export FZF_DEFAULT_COMMAND='fd --type f . $HOME'
export FZF_ALT_C_COMMAND='fd . $HOME'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --inline-info'

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/alduan/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/alduan/.fzf/shell/key-bindings.bash"
