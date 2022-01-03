## Set up path

path+="$HOME/.bin"
path+="$HOME/.local/bin"
path+="$HOME/Android/Sdk/platform-tools"

## Remove duplicates from path
# typeset -U path
typeset -UT PATH path

