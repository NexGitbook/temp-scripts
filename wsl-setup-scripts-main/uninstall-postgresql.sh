#!/bin/env bash

set -e

main() {
    read -p "Uninstall postgresql: Are you sure? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Uninstalling postgresql ..."
        sudo service postgresql stop
        sudo apt remove -y postgresql postgresql-contrib libpq-dev
        echo ""
        echo "Done"
    else
        echo ""
        echo "Aborted"
    fi
}

main
