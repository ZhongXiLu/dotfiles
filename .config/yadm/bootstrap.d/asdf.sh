#!/bin/bash

set -e

# Install plugins
asdf plugin-add java || true
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git || true
asdf plugin-add yarn || true

# Install
declare -a JAVA_VERSIONS=("8" "11" "17")
for JAVA_VERSION in "${JAVA_VERSIONS[@]}"; do
    asdf install java latest:corretto-$JAVA_VERSION
done
asdf install nodejs latest

# Set global versions
asdf global java latest:corretto-11
asdf global nodejs latest

echo "asdf ✅"
