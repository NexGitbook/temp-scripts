#!/bin/env bash

main() {
    read -p "Uninstall nodenv: Are you sure? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Uninstalling nodenv ..."
    else
        echo "Aborted"
        echo ""
    fi
}

main
