setxkbmap -option caps:ctrl_modifier

if command -v doas >/dev/null
then
    alias el='doas $SHELL'
else if command -v sudo >/dev/null
    alias el='sudo -E $SHELL'
fi

bak() {
    mkdir -p .bak
    FILE=".bak/$1.$(date --iso-8601).bak"
    num=1;
    while [ -e "$FILE" ]
    do
        FILE=".bak/$1.$(date --iso-8601).bak\ ($num)"
        let "num=num+1"
    done
    rsync -av "$1" "$FILE"
}

