#!/bin/bash

while read pkg; do
    brew install $pkg
done < ./brew.txt

brew link openssl --force
