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
alias be 'bundle exec'

function jj
    cd $argv && ls
end
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
        jj $recent
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

function gme
    git br | peco --layout=bottom-up | xargs git merge --no-ff
end

function grnm
    set -l rename_from (git br | peco --layout=bottom-up | xargs)
    if [ -z "$rename_from" ]
        return 1
    end
    echo "Set new branch name."
    set -l rename_to (read)
    echo "Are you sure rename branch $rename_from to $rename_to (y/n)"
    set -l confirm (read)
    switch "$confirm"
    case "y"
        git branch -m "$rename_from" "$rename_to"
    case "n"
        echo "branch rename cancelled..."
    case '*'
        echo "please select y or n keys."
    end
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

function glg_
    set -l branch_name (git br | peco --layout=bottom-up | xargs | sed "s/* //")
    echo "$branch_name"
    if [ $branch_name = (git branch --show-current) ]
        git log   
    else
        git log "$branch_name"
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

function tmux_setup
    if [ -z "$TMUX" ]
        tmux new -s main \; source-file $HOME/.config/tmux_source/file/at_terminal_starting.conf
    else
        echo "tmux is already setup."
        return 1
    end
end

set -x DISABLE_SPRING 1
set -x DISABLE_DATABASE_ENVIRONMENT_CHECK 1

if [ -z "$TMUX" ] && status --is-login
    set -x PATH $HOME/.anyenv/bin $PATH
    if ! [ -f "/tmp/anyenv_init.cache" ]
        anyenv init - > /tmp/anyenv_init.cache
    end
    eval (source /tmp/anyenv_init.cache)

    set -x PYENV_ROOT $HOME/.pyenv
    # fish_user_pathsに設定したらダメっぽい
    # set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
    set -x PATH $PYENV_ROOT/bin $PATH

    #if [ -d "$HOME/.local/share/vim-lsp-settings/servers/solargraph" ]
    #    set -x SOLARGRAPH_PATH $HOME/.local/share/vim-lsp-settings/servers/solargraph
    #end

    #if [ -d "$HOME/.cache/custom_bin" ]
    #    set -x PATH $HOME/.cache/custom_bin $PATH
    #end

    #status is-interactive; and pyenv init --path | source
    if ! [ -f "/tmp/pyenv_init.cache" ]
        pyenv init --path | source
        pyenv init - > /tmp/pyenv_init.cache
    end
    source /tmp/pyenv_init.cache
    #pyenv init - | source

    set -x PATH $HOME/.npm-global/bin $PATH
    set -x PATH $HOME/.cargo/bin $PATH

    set -x CUSTOM_PATH $PATH

    tmux_setup
else if [ -n "$CUSTOM_PATH" ]
    set -x PATH $CUSTOM_PATH
end
