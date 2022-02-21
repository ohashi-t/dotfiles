# source "$HOME/.cargo/env"
alias ls='ls -G'

j() {
    cd "$1" && pwd && ls -aGF
}
