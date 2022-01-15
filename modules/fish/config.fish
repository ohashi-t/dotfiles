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
alias ls 'ls -G'

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

    # vi-modeのキーバインド設定項目
    #fish_vi_key_bindings --no-erase
    #bind -M insert \cf accept-autosuggestion
    #bind \cf accept-autosuggestion
    #bind -M insert \ef forward-word
    #bind \ef forward-word
    #bind \co peco_ghq
    #bind -M insert \co peco_ghq
end

# 右端の時刻表示を無効にする
function fish_right_prompt
    echo
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

function peco_cd_current_dir
    cd (ls -l | grep ^d > /dev/null; and ls -d */ | peco; or ls -d)
end

function peco_nvim_current_files
    ls -F | grep -v "/" | peco | xargs nvim    

end

function pcp
    set peco_commands peco_cd_current_dir\npeco_nvim_current_files
    eval (echo "$peco_commands" | peco)
end

set -x DISABLE_SPRING 1
set -x DISABLE_DATABASE_ENVIRONMENT_CHECK 1

#set -x PATH $HOME/.npm-global/bin $PATH
set -g fish_user_paths $HOME/.npm-global/bin $fish_user_paths

# ログインシェルの場合のみ
# ex.)bashから起動した場合、bash_profileにanyenvに関する記述が既にあるとエラーになる
if [ "$SHELL" = "/usr/local/bin/fish" ]
    set -x PATH $HOME/.anyenv/bin $PATH
    eval (anyenv init - | source)
end

if [ -d "$HOME/.local/share/vim-lsp-settings/servers/solargraph" ]
    #set -x PATH $HOME/.local/share/vim-lsp-settings/servers/solargraph $PATH
    set -g fish_user_paths $HOME/.local/share/vim-lsp-settings/servers/solargraph $fish_user_paths
end

#set -x PATH $HOME/.cargo/bin $PATH
set -g fish_user_paths $HOME/.cargo/bin $fish_user_paths

set -x PYENV_ROOT $HOME/.pyenv
# fish_user_pathsに設定したらダメっぽい
# set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
#set -x PATH $PYENV_ROOT/bin $PATH
#set -x PATH $HOME/.npm-global/bin $PATH
set -g fish_user_paths $PYENV_ROOT/bin $fish_user_paths
set -g fish_user_paths $HOME/.npm-global/bin $fish_user_paths

status is-interactive; and pyenv init --path | source
pyenv init - | source

if [ -z "$TMUX" ]
    tmux new -s main \; source-file $HOME/.config/tmux_source/file/at_terminal_starting.conf
end
