#!/bin/bash

SOURCEDIR="/etc /home /var/lib/portage/world"
PASSWORD=123456
BASENAME=backup
BACKUPDIR=/tmp
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")

BAKFILE=$BACKUPDIR/$BASENAME-$TIMESTAMP.dat
SNARFILE=$BACKUPDIR/$BASENAME.snar

nice ionice -c 3 tar --create --verbose --exclude '*.log' --listed-incremental=$SNARFILE $SOURCEDIR | bzip2 | openssl enc -e -aes-256-cbc -pass pass:$PASSWORD > $BAKFILE
