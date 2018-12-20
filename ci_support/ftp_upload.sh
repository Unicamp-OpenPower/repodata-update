#!/usr/bin/env bash

set -e

FTP_HOST='oplab9.parqtec.unicamp.br'
LOCALPATH=$HOME/miniconda/repo
REMOTEPATH='/ppc64el/power-ai/'

# Upload json file from LOCALPATH to REMOTEPATH
lftp -f "
set dns:order "inet"
set net:timeout 15;
set net:reconnect-interval-base 5;
set net:max-retries 2;
set xfer:use-temp-file yes
set xfer:temp-file-name *.tmp
open ftp://$FTP_HOST
user $FTP_USER $FTP_PASSWORD
mirror -R --continue --reverse --no-empty-dirs --no-perms -i \.json$ $LOCALPATH $REMOTEPATH
bye
"
