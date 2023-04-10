#!/bin/bash

set -e

cd /tmp/
git clone git@bitbucket.org:persgroep/zcli.git || true
cd zcli
go install
zcli clean
zcli cert install
sudo zcli enable
zcli disable system
zcli enable system

echo "zcli ✅"
