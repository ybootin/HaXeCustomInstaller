#!/bin/bash

if [ -d /usr/lib/haxe-backup ]; then
    rm /usr/lib/haxe
    mv /usr/lib/haxe-backup/ /usr/lib/haxe/
else
    rm /usr/bin/haxe
    rm /usr/bin/haxedoc
    rm /usr/bin/haxelib
    rm /usr/lib/haxe
fi

rm -Rf /usr/lib/haxe2
rm -Rf /usr/lib/haxe3
rm /usr/bin/haxe2-switch
rm /usr/bin/haxe3-switch
