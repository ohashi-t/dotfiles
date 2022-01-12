#!/bin/bash

while read pkg_cask; do
    brew install --cask $pkg_cask
done < ./brew_cask.txt
