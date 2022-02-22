export PATH="$PATH:`yarn global bin`"

alias man="man -C ~/.man.conf"
alias ls="ls -G"

j() {
    if test $# -eq 0; then
        local target_dir=".."
    else
        local target_dir="$1"
    fi
    cd "$target_dir" && pwd && ls -aFG
}
