#!/bin/sh

set -e

test -z "$srcdir" && srcdir=$(dirname "$0")
test -z "$srcdir" && srcdir=.

cwd=$(pwd)
cd "$srcdir"

autoreconf --force --install --warnings=all

if test -z "${NOCONFIGURE}"; then
    set -x
    $srcdir/configure --prefix=/usr \
                      --disable-gtk_legacy \
                      --disable-gtk_next \
                      --disable-parallel \
                      --disable-chrome \
                      --disable-plank \
                      --disable-telegram \
		      \
                      --disable-cinnamon \
		      --disable-flashback \
		      --disable-unity \
		      --disable-xfce \
		      --disable-mate \
		      --disable-openbox \
		      \
		      --with-selection_color=#400080 \
                      --with-accent_color=#9575CD \
                      --with-suggestion_color=#673AB7 \
                      --with-destruction_color=#FF5252 \
		      \
		      --enable-plank \
                      "$@"
fi
