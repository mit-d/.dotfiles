# Create arch-dependant rc files
[ -f ~/.sh/"$OSTYPE.sh" ] && . ~/.sh/"$OSTYPE.sh" ||\
    echo "Creating new local configurations at \"~/.sh/$OSTYPE.sh\""\
    && mkdir -p ~/.sh\
    && touch ~/.sh/"$OSTYPE.sh"\
