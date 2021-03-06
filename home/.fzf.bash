# Setup fzf
# ---------
if [[ ! "$PATH" == */home/kou/.cache/dein/repos/github.com/junegunn/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/kou/.cache/dein/repos/github.com/junegunn/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/kou/.cache/dein/repos/github.com/junegunn/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/kou/.cache/dein/repos/github.com/junegunn/fzf/shell/key-bindings.bash"
