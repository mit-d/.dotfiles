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

## Cursor shape per vi mode (ZSH-only)
# Ghostty's shell-integration `cursor` feature is switched off (`no-cursor` in
# nix/home/ghostty.nix) because it hardcodes a *blinking* block for normal
# mode. `cursor-style-blink = false` cannot override it -- Ghostty documents
# that as "just the default state; running programs may override the cursor
# style using DECSCUSR" -- and `cursor:steady` is rejected by the config parser.
#
# DECSCUSR (CSI Ps SP q): 0 default, 1 blinking block, 2 steady block,
# 3 blinking underline, 4 steady underline, 5 blinking bar, 6 steady bar.
_cursor_shape() {
    case ${KEYMAP-} in
        vicmd | visual) print -n '\e[2 q' ;; # steady block: normal mode
        *) print -n '\e[5 q' ;;              # blinking bar: insert mode
    esac
}
zle -N _cursor_shape

# add-zle-hook-widget rather than defining zle-line-init/zle-keymap-select
# outright: zsh-autosuggestions wraps those widgets, and clobbering them breaks
# suggestions.
autoload -Uz add-zle-hook-widget
add-zle-hook-widget line-init _cursor_shape
add-zle-hook-widget keymap-select _cursor_shape

# Hand the terminal default back before running an external command, so vim,
# fzf and friends are not stuck with whatever shape the prompt left behind.
# autoload explicitly rather than relying on prompt.zsh having run first.
_cursor_reset() { print -n '\e[0 q' }
autoload -Uz add-zsh-hook
add-zsh-hook preexec _cursor_reset

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
