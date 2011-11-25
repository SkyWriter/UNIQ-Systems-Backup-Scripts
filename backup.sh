#!/bin/bash

SOURCEDIR=/tmp/test/
PASSWORD=123456
BASENAME=backup
BACKUPDIR=/tmp
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")

BAKFILE=$BACKUPDIR/$BASENAME-$TIMESTAMP.dat
SNARFILE=$BACKUPDIR/$BASENAME.snar

echo $TIMESTAMP

tar --create --listed-incremental=$SNARFILE $SOURCEDIR | bzip2 | openssl enc -e -aes-256-cbc -pass pass:$PASSWORD > $BAKFILE