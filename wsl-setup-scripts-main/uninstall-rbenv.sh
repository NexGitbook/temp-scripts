#!/bin/env bash

main() {
    read -p "Uninstall rbenv: Are you sure? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Uninstalling rbenv ..."
        mkdir -p ~/trash
        mv -f ~/.rbenv ~/trash
        echo "Done"
        echo ""
    else
        echo "Aborted"
        echo ""
    fi
}

main