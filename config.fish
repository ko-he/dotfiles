set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.anyenv/bin $PATH

eval (anyenv init - | source)

set --export LC_CTYPE en_US.UTF-8
set --export LC_ALL en_US.UTF-8

set --export OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES
set --export FZF_DEFAULT_OPTS '--height 40% --reverse --border'
