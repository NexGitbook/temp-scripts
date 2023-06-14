#!/bin/env bash

main() {
    local bashrc=$HOME/.bashrc
    
    echo "=> Installing nodenv..."
    git clone https://github.com/nodenv/nodenv.git ~/.nodenv
    cd ~/.nodenv && src/configure && make -C src
    echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> $bashrc
    ~/.nodenv/bin/nodenv init
    echo 'eval "$(nodenv init -)"' >> $bashrc
    . $bashrc

    echo "=> Installing node-build..."
    mkdir -p "$(nodenv root)"/plugins
    git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
    
    echo "=> Installing node 16"
    nodenv install 16.13.2
    nodenv global 16.13.2
    echo ""
    echo "Done."
}

main
