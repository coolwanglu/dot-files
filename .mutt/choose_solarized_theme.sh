#!/bin/bash
if [ `expr index "$TERM" "256"` != 0 ]; then
    echo -n "~/.mutt/mutt-colors-solarized-dark-256.muttrc"
else
    echo -n "~/.mutt/mutt-colors-solarized-dark-16.muttrc"
fi
