# Create arch-dependant rc files
[ -f ~/.sh/"$OSTYPE.shrc" ] && . ~/.sh/"$OSTYPE.shrc" ||\
    echo "Creating new local configurations at \"~/.sh/$OSTYPE.shrc\""\
    && mkdir -p ~/.sh\
    && touch ~/.sh/"$OSTYPE.shrc"\
