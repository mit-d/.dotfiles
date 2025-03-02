
## Set up path
if [ -d "$HOME/.npm_global/bin" ]; then
  path+="$HOME/.npm_global/bin"
fi

if [ -d "$HOME/.local/share/JetBrains/Toolbox/scripts" ]; then
  path+="$HOME/.local/share/JetBrains/Toolbox/scripts"
fi

if [ -d "$HOME/Android/Sdk/platform-tools" ]; then
  path+="$HOME/Android/Sdk/platform-tools"
fi

if [ -d "$HOME/bin" ]; then
  path+="$HOME/bin"
fi

if [ -d "$HOME/.bin" ]; then
  path+="$HOME/.bin"
fi

if [ -d "$HOME/.local/bin" ]; then
  path+="$HOME/.local/bin"
fi

## Remove duplicates from path
typeset -U -T PATH path
