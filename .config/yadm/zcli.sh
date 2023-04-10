#!/bin/bash

set -e

cd /tmp/
git clone git@bitbucket.org:persgroep/zcli.git || true

if cd zcli; then

    go install
    zcli clean
    zcli cert install
    sudo zcli enable
    zcli disable system
    zcli enable system

    echo "zcli ✅"

else
    echo -e "\033[33mSkipping zcli installation\033[0m"
fi
