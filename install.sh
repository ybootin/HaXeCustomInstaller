#!/bin/bash

#Only OSX files for the moment
VERSION=3
OS=osx
HAXE2FILE=haxe-2.10-$OS
HAXE3FILE=haxe-3.0.0-$OS
HAXE2DIR="http://haxe.org/file/$HAXE2FILE.tar.gz"
HAXE3DIR="http://haxe.org/file/$HAXE3FILE.tar.gz"

# Downloading haxe file
wget $HAXE2DIR
wget $HAXE3DIR

# extract
tar -xzf $HAXE2FILE.tar.gz
tar -xzf $HAXE3FILE.tar.gz

#clean
rm -Rf $HAXE2FILE.tar.gz
rm -Rf $HAXE3FILE.tar.gz

sudo mv $HAXE2FILE/ /usr/lib/haxe2/
sudo mv $HAXE3FILE/ /usr/lib/haxe3/

#backup current haxe
sudo mv /usr/lib/haxe/ /usr/lib/haxe-backup/

#activate specified version
sudo ln -s /usr/lib/haxe$VERSION/ /usr/lib/haxe

#activate switch script
sudo cp haxe2 /usr/bin/
sudo cp haxe3 /usr/bin/

sudo chmod +x /usr/bin/haxe2
sudo chmod +x /usr/bin/haxe3





