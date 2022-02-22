# source "$HOME/.cargo/env"
alias ls='ls -G'

j() {
    if test $# -eq 0; then
        local target_dir=".."
    else
        local target_dir="$1"
    fi
    cd $"target_dir" && pwd && ls -aFG
}
