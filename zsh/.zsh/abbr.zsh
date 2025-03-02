# Abbreviations
###############################################################################
setopt extendedglob
typeset -A abbrevs

# Git
abbrevs+=(
  "sw"      "switch" 
  "ga"      "git add"
  "gb"      "git branch"
  "gc"      "git commit"
  "gd"      "git diff"
  "gf"      "git fetch --prune --tags"
  "gl"      "git log"
  "glg"     "git log --graph --oneline"
  "glgl"    "git log --graph --oneline --all"
  "gr"      "git reset --mixed"
  "grh"     "git reset --hard"
  "grs"     "git reset --soft"
  "gs"      "git status"
  "gss"     "git status -s"
  #"gadcp"   "git add . && git commit -m 'Auto-commit' && git push"
  #"gai"     "git add --interactive"
  #"gap"     "git add --patch"
  #"gau"     "git add --update"
  #"gba"     "git branch -a"
  #"gbav"    "git branch -a -vv"
  #"gbm"     "git branch -M"
  #"gbmd"    'git branch --merged | grep  -v "\*\|main" | xargs -n1 git branch -d'
  #"gbsc"    "git branch --show-current"
  #"gbsmd"   "git fetch -p && for branch in \$(git branch -vv | grep ': gone]' | awk '{print \$1}'); do git branch -D \$branch; done"
  #"gbv"     "git branch -vv"
  #"gbz"     "git branch | fzf | xargs git checkout"
  #"gca"     "git commit --amend"
  #"gcane"   "git commit --amend --no-edit"
  #"gcdi"    "git clean -di"
  #"gci"     "git commit --interactive"
  #"gcm"     "git commit --message"
  #"gcwip"   "git commit -m 'WIP'"
  #"gdc"     "git diff --cached"
  #"gdm"     "git diff origin/main..__CURSOR__"
  #"gdt"     "git difftool"
  #"gfo"     "git fetch origin"
  #"gfp"     "git fetch --prune"
  #"gfpt"    "git fetch --prune --tags"
  #"gmnf"    "git merge --no-ff"
  #"gpf"     "git push --force-with-lease"
  #"gpl"     "git pull"
  #"gpo"     "git push origin"
  #"gpod"    "git push origin --delete"
  #"grb"     "git rebase"
  #"grba"    "git rebase --abort"
  #"grbc"    "git rebase --continue"
  #"grbi"    "git rebase -i"
  #"grbm"    "git rebase origin/main"
  #"gre"     "git restore --staged --worktree"
  #"grh"     "git reset --hard"
  #"grs"     "git reset --soft"
  #"grsm"    "git reset --soft origin/main"
  #"gs-"     "git switch -"
  #"gsc"     "git switch -C"
  #"gsgl"    "git submodule -q foreach git pull -q origin main"
  #"gsm"     "git switch main"
  #"gsti"    "git stashed --keep-index"
  #"gstl"    "git stash list"
  #"gstl"    "git status"
  #"gstp"    "git stash pop"
  #"gsts"    "git stash --staged"
  #"gsu"     "git submodule update --init --recursive"
)

# Docker
abbrevs+=(
  "dk"    "docker"
  "dkr"   "docker run -it"
  "dki"   "docker images"
  "dkig"  "docker images | grep __CURSOR__ | awk '{print \$3}'"
  "dkbd"  "docker build ."
  "dkbt"  "docker build -t __CURSOR__ ."
  "drid"  "docker rmi -f \$(docker images -q -f \"dangling=true\")"
  "dco"   "docker compose"
  "dcr"   "docker compose run -it __CURSOR__ --rm"
)

# Package Manager
abbrevs+=(
  "apts"  "apt search"
  "aptl"  "apt list"
  "aptlu" "apt list -u"
  "apti"  "apt install"
  "aptr"  "apt remove --purge"
  "aptu"  "apt update"
  "aptug" "sh -c 'apt update && apt-get dist-upgrade'"
  "aptar" "apt autoremove"
  "flup"  "flatpak update"
)

# Misc
abbrevs+=(
  "sudo"  "doas"
  "eof"   "<<EOF"
  "manz"  "apropos __CURSOR__ | fzf | cut -f1,2 -d' ' | xargs man"
  "ctl"   "doas systemctl"
  "ctle"  "doas systemctl enable"
  "ctlre" "doas systemctl restart"
  "ctls"  "doas systemctl stop"
)

# Loop over the keys of the abbreviations array and create aliases for each
for abbr in ${(k)abbrevs}; do
  alias $abbr="${abbrevs[$abbr]}"
done

magic-abbrev-expand() {
  local MATCH
  # Remove (from the end of LBUFFER) any continuous alphanumeric/underscore characters
  # and capture them in MATCH
  LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}

  # Look up the abbreviation in the abbrevs associative array
  command=${abbrevs[$MATCH]}

  # Append the command if found, otherwise the original MATCH
  LBUFFER+=${command:-$MATCH}

  # If the expanded text contains __CURSOR__, split it into left and right buffers
  if [[ "${command}" =~ "__CURSOR__" ]]; then
    RBUFFER=${LBUFFER[(ws:__CURSOR__:)2]}
    LBUFFER=${LBUFFER[(ws:__CURSOR__:)1]}
  else
    # If there's no cursor placeholder, just insert a space
    zle self-insert
  fi
}

magic-abbrev-expand-and-execute() {
  # Perform the abbreviation expansion
  magic-abbrev-expand
  # Remove the last character (usually the space or the newline)
  zle backward-delete-char
  # Accept the current command line and execute
  zle accept-line
}

no-magic-abbrev-expand() {
  # Insert a literal space without expanding an abbreviation
  LBUFFER+=' '
}

# Create ZLE widgets from the functions above
zle -N magic-abbrev-expand
zle -N magic-abbrev-expand-and-execute
zle -N no-magic-abbrev-expand

# Bind keys to the custom widgets
bindkey " " magic-abbrev-expand               # Space triggers abbreviation expansion
bindkey "^M" magic-abbrev-expand-and-execute  # Enter triggers expansion plus command execution
bindkey "^x " no-magic-abbrev-expand          # Ctrl+x + space inserts space literally
bindkey -M isearch " " self-insert            # During isearch, space just inserts space

# Ensures that autosuggestions are cleared when custom ENTER widget is used
export ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(magic-abbrev-expand-and-execute)
