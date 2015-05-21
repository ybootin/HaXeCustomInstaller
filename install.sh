#!/bin/bash

#Only OSX files for the moment
OS=osx
HAXE2FILE=haxe-2.10-$OS
HAXE3FILE=haxe-3.0.0-$OS
HAXE2DIR="http://old.haxe.org/file/$HAXE2FILE.tar.gz"
HAXE3DIR="http://old.haxe.org/file/$HAXE3FILE.tar.gz"

#check existing install
if [ -d /usr/lib/haxe2/ ]; then
    echo 'already installed, to uninstall, please run uninstall script'
    exit
fi

# Downloading haxe file
echo "Downloading HaXe2 & HaXe3, please wait"
curl -C - -O $HAXE2DIR
curl -C - -O $HAXE3DIR

# extract
tar -xzf $HAXE2FILE.tar.gz
tar -xzf $HAXE3FILE.tar.gz

#clean
rm -Rf $HAXE2FILE.tar.gz
rm -Rf $HAXE3FILE.tar.gz

mv $HAXE2FILE/ /usr/lib/haxe2/
mv $HAXE3FILE/ /usr/lib/haxe3/

#keep current haxe version, to be restore on uninstall
if [ -d /usr/lib/haxe ]; then
mv /usr/lib/haxe/ /usr/lib/haxe-backup/
fi

# we use haxe3 by default
ln -s /usr/lib/haxe3 /usr/lib/haxe

# remove the default alias if exists
if [ -e /usr/bin/haxe ]; then
    rm /usr/bin/haxe
    rm /usr/bin/haxedoc
    rm /usr/bin/haxelib
fi

# do the default install stuff
ln -s /usr/lib/haxe/haxe /usr/bin/haxe
ln -s /usr/lib/haxe/haxedoc /usr/bin/haxedoc
ln -s /usr/lib/haxe/haxelib /usr/bin/haxelib


cp haxe2-switch /usr/bin
cp haxe3-switch /usr/bin






