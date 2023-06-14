#!/bin/env bash

set -e

main() {
    echo "Installing postgresql ..."
    sudo apt install -y postgresql postgresql-contrib libpq-dev
    sudo service postgresql start
    sudo -u postgres bash -c "createuser -s $USER"
    sudo -u postgres bash -c "createdb $USER"
    createuser -s $USER
    echo ""
    echo "Done"
}

main