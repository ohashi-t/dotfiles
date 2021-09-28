# initialize
function fish_prompt
    if [ $status -eq 0 ]
        set status_face (set_color green)"(*´ω｀*) < "
    else
        set status_face (set_color red)"｡+ﾟ(∩´﹏'∩)ﾟ+｡ < "
    end
    printf '%s %s' (set_color yellow)(prompt_pwd) $status_face
end
# alias
alias man 'man -C ~/.man.conf'
alias cdd 'cd ~/Desktop'
alias gbr 'git branch'
alias gst 'git status'
alias gco 'git commit'
alias gdf 'git diff'
alias gad 'git add'
alias glg 'git log'
alias txks 'tmux kill-server'
alias txa 'tmux a'

abbr -a bundle "spring stop;bundle"

function peco_select_history
    if test (count $argv) = 0
        set peco_flags
    else
        set peco_flags --query "$argv"
    end
    history|peco $peco_flags|read foo
    if [ $foo ]
        commandline $foo
    else
        commandline ''
    end
end
function peco_z
    set -l query (commandline)
    if test -n $query
        set peco_flags --query "$query"
    end
    z -l | peco $peco_flags --layout=bottom-up | awk '{ print $2 }' | read recent
    if [ $recent ]
        cd $recent
        commandline -r ''
        commandline -f repaint
    end
end
function peco_ghq
    set -l query (commandline)
    if test -n $query
        set peco_flags --query "$query"
    end
    ghq list --full-path | peco $peco_flags --layout=bottom-up | read recent
    if [ $recent ]
        cd $recent
        commandline -r ''
        commandline -f repaint
    end
end
function fish_user_key_bindings
    bind \cr 'peco_select_history (commandline -b)'
    bind \co peco_ghq
    bind \cq peco_z
    bind \cg fzf
end

function gch
    git br | peco --layout=bottom-up | xargs git checkout
end

function gbrD
    set -l delete_branch (git br | peco --layout=bottom-up | xargs)
    if [ -z "$delete_branch" ]; then
        return 1
    end
    echo "Are you sure you delete $delete_branch (y/n)"
    set -l confirm (read)
    switch "$confirm"
    case "y"
        git branch -D "$delete_branch"
    case "n"
        echo "delete branch cancelled..."
    case '*'
        echo "please select y or n keys."
    end
end

set -x PATH $HOME/.npm-global/bin $PATH

# ログインシェルの場合のみ
# ex.)bashから起動した場合、bash_profileにanyenvに関する記述が既にあるとエラーになる
if [ "$SHELL" = "/usr/local/bin/fish" ]
    set -x PATH $HOME/.anyenv/bin $PATH
    eval (anyenv init - | source)
end

set -x PATH $HOME/.cargo/bin $PATH

set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

status is-interactive; and pyenv init --path | source
pyenv init - | source
