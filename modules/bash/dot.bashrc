# source "$HOME/.cargo/env"
alias ls='ls -G'

j() {
    cd $(test $# -eq 0 && (echo "..";:) || echo "$1") && pwd && ls -aFG
}

git_ls_files_in_toplevel() {
    local git_top=$(git rev-parse --show-toplevel)
    local target_repo=$(cd $git_top && git ls-files | gsed -E '/^[^/]*$/d' | gsed -E 's;/[^/]*$;;g' | sort | uniq | fzf)
    cd "$git_top/$target_repo" && pwd && ls -aFG
}

module_dir() {
  test $(uname -s) == Darwin && test $(uname -m) == arm64 && echo '/opt/homebrew/bin';: || echo '/usr/local/bin'
}
