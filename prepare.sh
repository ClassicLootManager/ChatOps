#!/bin/sh

VERSION=$1
pipx install gitman
gitman install
find libs -type d -name ".git" -execdir rm -rf {} \; -prune
sed -i "s/{VERSION}/$VERSION/g" *.toc
name=$(basename $(pwd))
echo "Directory name is $name"
cd ..
zip -r $name/release.zip $name
cd $name