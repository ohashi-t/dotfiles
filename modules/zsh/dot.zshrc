export PATH="$PATH:`yarn global bin`"

alias man="man -C ~/.man.conf"
alias ls="ls -G"

j() {
    cd "$1" && pwd && ls -aFG
}
