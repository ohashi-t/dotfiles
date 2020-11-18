#!/bin/bash

while read pkg_cask; do
    brew cask install $pkg_cask
done < ./brew_cask.txt

while read pkg; do
    brew install $pkg
done < ./brew.txt

brew link openssl --force
