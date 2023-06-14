#!/bin/env bash

main() {
    echo "Installing essentials ..."
    sudo apt update
    sudo apt install -y build-essential \
        autoconf bison patch rustc libssl-dev libyaml-dev \
        libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev \
        libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev
    echo ""
    echo "Done"
}

main