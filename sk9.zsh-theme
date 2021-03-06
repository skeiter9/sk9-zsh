# fino-time.zsh-theme

# Use with a dark background and 256-color terminal!
# Meant for people with RVM and git. Tested only on OS X 10.7.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '⠠⠵' && return
    echo '❯'
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $SHORT_HOST || echo $HOST
}


local rvm_ruby='[$(rvm-prompt i v g)]%{$reset_color%}'
local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'
local nvm_node='[$(nvm current)]'


PROMPT="╭─%{$FG[040]%}%n%{$reset_color%}%{$FG[white]%}@%{$reset_color%}%{$FG[033]%}$(box_name)%{$reset_color%}%{$FG[white]%}%{$reset_color%} %{$terminfo[bold]$FG[226]%}${current_dir}%{$reset_color%}${git_info} %{$FG[125]%}${rvm_ruby}%{$reset_color%}%{$FG[049]%}${nvm_node}%{$reset_color%}
╰─$(virtualenv_info)$(prompt_char) "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[043]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔%{$reset_color%}"

RPROMPT='${return_status}$(git_prompt_status) %{$FG[031]%} %*%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
