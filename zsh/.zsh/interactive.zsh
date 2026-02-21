# interactive.zsh - ZSH-specific interactive features
# This file contains ZSH-only functionality that cannot be converted to POSIX

## Path deduplication (ZSH-only)
typeset -U -T PATH path

## Suffix Aliases (ZSH-only)
for type in txt md; do
    alias -s $type="${EDITOR:-nano} -- "
done

## Expand aliases with Control-Space (ZSH-only)
function expand-alias() { zle _expand_alias }
zle -N expand-alias && bindkey '^ ' expand-alias

## git_update_mr completion (ZSH-only)
# Helper function for git branch completion
_git_branch_names() {
    local -a branches
    branches=(${(f)"$(git branch -a 2>/dev/null | sed 's/^[* ] //' | sed 's/^remotes\///')"})
    _describe 'git branches' branches
}

# Tab completion for git_update_mr
_git_update_mr_completion() {
    local -a options=(
        '-e[Enable editing of the info file]'
        '--edit[Enable editing of the info file]'
        '-u[Upload to GitLab using glab command]'
        '--upload[Upload to GitLab using glab command]'
        '-s[Download description from GitLab before editing]'
        '--sync[Download description from GitLab before editing]'
        '-f[Use specific info file]:file:_files'
        '-h[Show help message]'
        '--help[Show help message]'
    )
    _arguments -s $options '1:base branch:_git_branch_names' '2:target branch:_git_branch_names'
}

compdef _git_update_mr_completion git_update_mr
