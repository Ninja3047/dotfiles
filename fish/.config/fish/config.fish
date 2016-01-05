set fish_greeting
set -gx TERM st-256color
set -gx EDITOR nvim
set -gx PATH $PATH ~/.scripts

# Base 16 Shell
eval sh $HOME/.config/base16-shell/base16-default.dark.sh

function parse_git_branch
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
end
