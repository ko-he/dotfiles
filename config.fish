set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.anyenv/bin $PATH
set -x PATH $HOME/bin $PATH

status --is-interactive; and source (anyenv init -|psub)

set --export LC_CTYPE en_US.UTF-8
set --export LC_ALL en_US.UTF-8

set --export OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES
set --export FZF_DEFAULT_OPTS '--height 40% --reverse --border'

set --export KUBECONFIG $HOME/.kube/config
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths

set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"

set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig"

set -x PATH $GOPATH/bin $PATH

set -x PATH $HOME/.flutter/bin $PATH

set -x VISUAL nvim
