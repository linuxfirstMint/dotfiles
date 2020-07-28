# Setup fzf
# ---------
if [[ ! "$PATH" == */home/kou/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/kou/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/kou/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/kou/.fzf/shell/key-bindings.bash"
