#!/bin/bash

while read pkg; do
    brew install $pkg && echo "package:${pkg} install completed!"
done < ./brew.txt

brew link openssl --force
