#!/usr/bin/env bash

set -e

FTP_HOST='oplab9.parqtec.unicamp.br'
LOCALPATH=$HOME/miniconda/repo/linux-ppc64le
REMOTEPATH='/ppc64el/power-ai/linux-ppc64le'

# Upload json file from LOCALPATH to REMOTEPATH
lftp -f "
set dns:order "inet"
set net:timeout 15
set net:reconnect-interval-base 5
set net:max-retries 2
open ftp://$FTP_HOST
user $FTP_USER $FTP_PASSWORD
mirror -R --continue --reverse --no-empty-dirs --no-perms -i \.repodata.$ $LOCALPATH $REMOTEPATH
bye
"
