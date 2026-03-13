# shellcheck shell=sh
# nvm.sh - NVM setup with fast node access
# POSIX-compliant shell script

export NVM_DIR="$HOME/.nvm"

# Add the default node version's bin to PATH directly (avoids loading nvm)
if [ -d "$NVM_DIR/versions/node" ] && [ -f "$NVM_DIR/alias/default" ]; then
    _nvm_default="$(cat "$NVM_DIR/alias/default")"
    for _nvm_dir in "$NVM_DIR/versions/node"/v${_nvm_default}*/bin; do
        if [ -d "$_nvm_dir" ]; then
            PATH="$_nvm_dir:$PATH"
            export NVM_BIN="$_nvm_dir"
        fi
    done
    unset _nvm_default _nvm_dir
fi

# Only lazy-load nvm itself (node/npm/npx are already on PATH)
if [ -d "$NVM_DIR" ] || [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
    nvm() {
        unset -f nvm 2>/dev/null
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
        [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
        nvm "$@"
    }
fi
