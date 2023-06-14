#!/bin/env bash

set -e

main() {
    read -p "Uninstall nodenv: Are you sure? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Uninstalling nodenv ..."
        mkdir -p ~/trash
        mv -f ~/.nodenv ~/trash
        echo "Done"
        echo ""
    else
        echo "Aborted"
        echo ""
    fi
}

main
