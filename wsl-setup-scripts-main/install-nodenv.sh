#!/bin/env bash

main() {
    echo "Installing nodenv..."
    git clone https://github.com/nodenv/nodenv.git ~/.nodenv
    cd ~/.nodenv && src/configure && make -C src
    echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bashrc
    ~/.nodenv/bin/nodenv init
    echo 'eval "$(nodenv init -)"' >> ~/.bashrc
    source ~/.bashrc
    echo "Installing node-build..."
    mkdir -p "$(nodenv root)"/plugins
    git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
    echo "Installing node 16.10.0 ..."
    nodenv install 16.10.0
    nodenv global 16.10.0
    echo "Installing node 14.21.2 ..."
    nodenv install 14.21.2
    echo ""
    echo "Done."
}

main
