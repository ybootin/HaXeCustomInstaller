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

mv $HAXE2FILE/ /usr/lib/haxe2/
mv $HAXE3FILE/ /usr/lib/haxe3/

#activate specified version
ln -s /usr/lib/haxe2/haxe /usr/bin/haxe2
ln -s /usr/lib/haxe3/haxe /usr/bin/haxe3

chmod +x /usr/bin/haxe2
chmod +x /usr/bin/haxe3





