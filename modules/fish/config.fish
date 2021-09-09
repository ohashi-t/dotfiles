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
