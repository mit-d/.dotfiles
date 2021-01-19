#!/bin/sh
while true
do
    BATTERY="$(acpi | sed -e "/Battery 1/d" -e "s/,//g" | tr '\ ' '\t' | cut -f 4)"
    DATE="$(date +'%I:%M')"

    tmpfile=/tmp/XSETROOT_NEXT
    if [ -f $tmpfile ]
    then
        xsetroot -name "$(cat $tmpfile)"
        rm $tmpfile
    else
        xsetroot -name "    $BATTERY $DATE    "
    fi

    sleep 1
done
