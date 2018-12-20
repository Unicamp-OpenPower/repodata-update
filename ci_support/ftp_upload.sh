#!/usr/bin/env bash

set -e

FTP_HOST='oplab9.parqtec.unicamp.br'
LOCALPATH=$HOME/miniconda/repo
REMOTEPATH='/ppc64el/power-ai/linux-ppc64le'

echo "Starting upload..."

# Upload json file from LOCALPATH to REMOTEPATH
lftp -d -u $FTP_USER,$FTP_PASSWORD $FTP_HOST << EOF
set dns:order inet
set net:timeout 15
set net:reconnect-interval-base 5
set net:max-retries 2
mirror -R --continue --reverse --no-empty-dirs --no-perms -i repodata* $LOCALPATH $REMOTEPATH
EOF

echo "Finishing upload..."
