## Set up path

if [ -d "$HOME/.npm_global/bin" ]; then
  path+="$HOME/.npm_global/bin"
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

# Homebrew
if [ -d "/opt/homebrew/bin" ]; then
  path+="/opt/homebrew/bin"
fi
if [ -d "/opt/homebrew/opt/postgresql@13/bin" ]; then
  path+="/opt/homebrew/opt/postgresql@13/bin"
fi

# JetBrains
if [ -d "$HOME/Library/Application Support/JetBrains/Toolbox/scripts" ]; then
  path+="$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
fi
if [ -d "$HOME/.local/share/JetBrains/Toolbox/scripts" ]; then
  path+="$HOME/.local/share/JetBrains/Toolbox/scripts"
fi
if [ -d "$HOME/Android/Sdk/platform-tools" ]; then
  path+="$HOME/Android/Sdk/platform-tools"
fi

# Java
if [ -d "/opt/homebrew/opt/openjdk/bin" ]; then
  path+="/opt/homebrew/opt/openjdk/bin"
fi
## Remove duplicates from path
typeset -U -T PATH path
