#!/bin/sh

if echo "$BROWSERS" | grep -q "Chrome"; then
    echo "Installing Google Chrome"
    apt-get install -y google-chrome-stable
fi

if echo "$BROWSERS" | grep -q "Firefox"; then
    echo "Installing Firefox"
    apt-get install -y firefox-esr
fi
